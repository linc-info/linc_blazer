class CourseMember < ApplicationRecord
  self.table_name = 'course_member'
  self.inheritance_column = :_type_disabled
end
# 5156