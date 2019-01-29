class Course < ApplicationRecord
  self.table_name = 'course_v8'
  self.inheritance_column = :_type_disabled

  has_many :course_tasks, foreign_key: "courseId"
  belongs_to :course_set, foreign_key: "courseSetId"
end
