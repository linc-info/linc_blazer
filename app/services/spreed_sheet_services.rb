require 'google_drive'
require 'googleauth'
require 'googleauth/stores/file_token_store'

class SpreedSheetServices
  def initialize
    @session = GoogleDrive::Session.from_service_account_key(ENV.fetch('CONFIG') {'google_drive_config.json'})
  end

  def init_title
    id = ENV.fetch('KPI_ID') {'116l_Ui1imlsS54SGm7H5PNaFTCcyuQcLo4abmFaQCac'}
    gid = ENV.fetch('KPI_GID') {'0'}
    @worksheet = @session.spreadsheet_by_key(id).worksheet_by_gid(gid)
    @worksheet[1, 1] = "name"
    @worksheet[1, 2] = "phone"
    @worksheet[1, 3] = "lesson_name"
    @worksheet[1, 4] = "finished_at"
    @worksheet[1, 5] = "user_id"
    @worksheet[1, 6] = "lesson_id"
    @worksheet.save
  end

  def get_course_names
    course_names = {}
    CourseSet.where(status: 'published').includes(:course_tasks).where(course_task: {status: 'published'}).each do |course_set|
      course_set.course_tasks.each do |course_task|
        course_names[course_task.id] = course_set.title + ":" + course_task.title
      end
    end
    course_names
  end

  def update_info
    course_names = get_course_names
    i = 2
    User.where(id: CourseTaskResult.select(:userId).distinct).includes(:course_task_results).each do |user|
      user.course_task_results.each do |course_task_result|
        next if course_names[course_task_result.courseTaskId].blank? || course_task_result.status != "finish"
        @worksheet[i, 1] = user.nickname
        @worksheet[i, 2] = user.verifiedMobile
        @worksheet[i, 3] = course_names[course_task_result.courseTaskId]
        @worksheet[i, 4] = Time.at(course_task_result.finishedTime).to_s
        @worksheet[i, 5] = user.id
        @worksheet[i, 6] = course_task_result.courseTaskId
        i += 1
        @worksheet.save if i % 100 == 0
      end
    end
    @worksheet.save
  end
end
