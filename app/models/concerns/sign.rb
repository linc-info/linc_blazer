module Concerns::Sign
  extend ActiveSupport::Concern

  ROLE = '|ROLE_USER|'
  REGIST_TYPE = 'web_mobile'
  PASSWORD_REGEXP = /\A[\S]{5,20}\z/
  REGISTERED_WAY = 'app'

  module ClassMethods
    def sign_up(phone, nickname, password)
      salt = Security.generate_salt
      now = Time.zone.now.to_i
      transaction do
        user = create!(verifiedMobile: phone, nickname: nickname, password: Security.encode_password(password, salt),salt: salt,
                       roles: ROLE, type: REGIST_TYPE, email: Security.generate_fake_email, loginSessionId: SecureRandom.hex(13),
                       uuid: Security.generate_uuid, registeredWay: REGISTERED_WAY,createdTime: now, updatedTime: now)
        user.user_profiles.create!(truename: nickname, mobile: phone)
        {session_id: user.loginSessionId, nickname: user.nickname}
      end
    end
  end

end