require 'base64'
require 'digest'
class SecurityServices
  class << self
    def encode_password(password, salt)
      salted = password.to_s + "{" + salt + "}"
      digest = Digest::SHA256.digest salted
      4999.times {digest = Digest::SHA256.digest digest + salted}
      Base64.encode64(digest).strip
    end

    def generate_salt
      Digest::SHA1.hexdigest SecureRandom.uuid
    end
  end
end










