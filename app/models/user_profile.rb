class UserProfile < ApplicationRecord
  self.table_name = 'user_profile'
  self.inheritance_column = :_type_disabled
  self.ignored_columns = %w(class)

  belongs_to :user, foreign_key: 'id'

  def created_at
    Time.at(createdTime)
  end
end