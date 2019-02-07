class OpenCourse < ApplicationRecord
  self.table_name = 'open_course'
  self.inheritance_column = :_type_disabled

  has_many :open_course_likes
  has_one :open_course_lesson, foreign_key: 'courseId'

  def img
    get_img_url(middlePicture)
  end
end