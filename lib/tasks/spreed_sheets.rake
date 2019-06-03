namespace :spreed_sheets do
  desc 'update user task'
  task update_user_task: :environment do
    # UserTaskSheetWorker.perform_async
    service = SpreedSheetServices.new
    service.init_title
    service.update_info
  end
end