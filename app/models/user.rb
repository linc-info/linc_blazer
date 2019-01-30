class User < ApplicationRecord
  include Concerns::Sign
  self.table_name = 'user'
  self.inheritance_column = :_type_disabled

  has_many :user_profiles, foreign_key: 'id'

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