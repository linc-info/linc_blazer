namespace :spreed_sheets do
  desc 'update user task'
  task update_user_task: :environment do
    # UserTaskSheetWorker.perform_async
    service = SpreedSheetServices.new
    service.update_user_task
  end

  desc 'update user login'
  task update_user_login: :environment do
    # UserTaskSheetWorker.perform_async
    service = SpreedSheetServices.new
    service.update_user_login
  end

  task update_user_sign_up: :environment do
    # UserTaskSheetWorker.perform_async
    service = SpreedSheetServices.new
    service.update_user_sign_up
  end
end