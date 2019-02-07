class OpenCourseLesson < ApplicationRecord
  self.table_name = 'open_course_lesson'
  self.inheritance_column = :_type_disabled
end