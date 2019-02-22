class Log < ApplicationRecord
  self.table_name = 'log'
  self.inheritance_column = :_type_disabled
end