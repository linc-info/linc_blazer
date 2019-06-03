class CourseTaskResult < ApplicationRecord
  self.table_name = 'course_task_result'
  self.inheritance_column = :_type_disabled

  belongs_to :course, foreign_key: "courseId"
  belongs_to :course_task, foreign_key: "courseTaskId"
  belongs_to :user, foreign_key: "userId"
end
