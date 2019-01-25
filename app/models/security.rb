require 'base64'
require 'digest'
class Security
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

    def sign(secret, nonce, url)
      OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), secret, "#{nonce}#{url}")
    end

    def verify?(token, nonce, signature, url)
      (app_token == token) && sign(app_secret, nonce, url) == signature
    end

    def app_token
      ENV['APP_TOKEN']
    end

    def app_secret
      ENV['APP_SECRET']
    end
  end
end










