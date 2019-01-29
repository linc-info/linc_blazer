class User < ApplicationRecord
  self.table_name = 'user'
  self.inheritance_column = :_type_disabled

  PASSWORD_REGEXP = /\A[\S]{5,20}\z/

  validates :email, uniqueness: true
  validates_with Validations::EmailValidator

  validates :verifiedMobile, uniqueness: true
  validates_with Validations::PhoneValidator

  validates :nickname, uniqueness: true, length: { minimum: 4, maximum: 18 }
  validates_with Validations::NicknameValidator

  def created_at
    Time.at(createdTime)
  end

  def phone
    verifiedMobile
  end

  def update_session_id
    update!(loginSessionId: SecureRandom.hex(13), loginTime: Time.zone.now.to_i)
  end
end