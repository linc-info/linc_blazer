class Log < ApplicationRecord
  self.table_name = 'log_v8'
  self.inheritance_column = :_type_disabled

  belongs_to :user, foreign_key: "userId"
end
