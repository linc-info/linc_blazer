class OpenCourseLike < ApplicationRecord
  self.table_name = 'linc_open_course_likes'

  belongs_to :open_course
end