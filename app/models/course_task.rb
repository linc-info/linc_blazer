class CourseTask < ApplicationRecord
  self.table_name = 'course_task'
  self.inheritance_column = :_type_disabled

  belongs_to :course, foreign_key: "courseId"
end
