class User < ApplicationRecord
  self.table_name = 'user'
  self.inheritance_column = :_type_disabled

  def created_at
    Time.at(createdTime)
  end

  def phone
    verifiedMobile
  end
end