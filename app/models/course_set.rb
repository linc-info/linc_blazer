class CourseSet < ApplicationRecord
  self.table_name = 'course_set_v8'
  self.inheritance_column = :_type_disabled

  has_one :course
end
