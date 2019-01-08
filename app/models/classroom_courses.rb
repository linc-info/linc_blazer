class ClassroomCourses < ApplicationRecord
  self.table_name = 'classroom_courses'
  self.inheritance_column = :_type_disabled
end