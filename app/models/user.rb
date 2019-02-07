class User < ApplicationRecord
  include Concerns::Sign
  self.table_name = 'user'
  self.inheritance_column = :_type_disabled

  has_one :user_profile, foreign_key: 'id'
  has_many :article_likes, foreign_key: 'userId'
  has_many :articles, through: :article_likes
  has_many :open_course_likes
  has_many :open_courses, through: :open_course_likes

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

  def update_password(password)
    update!(password: Security.encode_password(password, salt))
  end
end