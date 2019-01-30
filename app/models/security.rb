require 'base64'
require 'digest'
require 'openssl'
class Security
  FAKE_EMAIL_PREFIX = '__fake__'
  class << self
    def encode_password(password, salt)
      salted = password.to_s + "{" + salt + "}"
      digest = Digest::SHA256.digest salted
      4999.times {digest = Digest::SHA256.digest digest + salted}
      Base64.encode64(digest).strip
    end

    def generate_uuid
      Digest::SHA1.hexdigest SecureRandom.uuid
    end

    def generate_salt
      Base64.encode64(Digest::SHA1.hexdigest SecureRandom.hex).truncate(32, omission: '')
    end

    def generate_session_id
      Digest::SHA1.hexdigest SecureRandom.hex
    end

    def sign(secret, nonce)
      OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), secret, nonce)
    end

    def generate_fake_email
      FAKE_EMAIL_PREFIX + Time.zone.now.to_i.to_s + 6.times.map {rand(10)}.join + '@fakeemail.com'
    end

    def verify?(nonce, signature)
      sign(app_secret, nonce) == signature
    end

    def app_token
      ENV['APP_TOKEN']
    end

    def app_secret
      ENV['APP_SECRET']
    end
  end
end










