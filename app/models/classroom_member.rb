class ClassroomMember < ApplicationRecord
  self.table_name = 'classroom_member'
  self.inheritance_column = :_type_disabled
end