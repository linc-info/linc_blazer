class SendSignUpMessageWorker
  include Sidekiq::Worker
  def perform(user_id)
    SlackServices.new.send_sign_up_message(user_id)
  end
end