require 'google_drive'
require 'googleauth'
require 'googleauth/stores/file_token_store'

class SpreedSheetServices
  def initialize
    @session = GoogleDrive::Session.from_service_account_key(ENV.fetch('CONFIG') {'google_drive_config.json'})
  end

  def update_user_login
    id = ENV.fetch('KPI_ID') {'1vUCEtGpua3oMMHHyQl0hx88s6XCJ0vMKf2P5E1MecTE'}
    gid = ENV.fetch('KPI_GID') {'0'}
    @worksheet = @session.spreadsheet_by_key(id).worksheet_by_gid(gid)
    @worksheet[1, 1] = "user_id"
    @worksheet[1, 2] = "name"
    @worksheet[1, 3] = "phone"
    @worksheet[1, 4] = "login_at"
    @worksheet.save
    update_login_info
  end

  def update_user_sign_up
    id = ENV.fetch('KPI_ID') {'1vUCEtGpua3oMMHHyQl0hx88s6XCJ0vMKf2P5E1MecTE'}
    gid = ENV.fetch('KPI_GID') {'1366587826'}
    @worksheet = @session.spreadsheet_by_key(id).worksheet_by_gid(gid)
    @worksheet[1, 1] = "user_id"
    @worksheet[1, 2] = "name"
    @worksheet[1, 3] = "phone"
    @worksheet[1, 4] = "sign_at"
    @worksheet.save

    User.all.each_with_index do |user, i|
      i += 2
      @worksheet[i, 1] = user.id
      @worksheet[i, 2] = user.nickname
      @worksheet[i, 3] = user.verifiedMobile
      @worksheet[i, 4] = Time.at(user.createdTime).to_s
      @worksheet.save if i % 100 == 0
    end
    @worksheet.save
  end

  def update_login_info
    Log.where(action: "login_success").includes(:user).each_with_index do |log, i|
      i += 2
      @worksheet[i, 1] = log.user.id
      @worksheet[i, 2] = log.user.nickname
      @worksheet[i, 3] = log.user.verifiedMobile
      @worksheet[i, 4] = Time.at(log.createdTime).to_s
      @worksheet.save if i % 100 == 0
    end
    @worksheet.save
  end

  def update_user_task
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
    update_task_info
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

  def update_task_info
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
