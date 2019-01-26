class Api::V1::NotificationController < Api::V1::ApiController
  before_action :check_phone_format, only: :send_sns
  before_action :check_phone_exist, only: :send_sns
  before_action :check_sns_token, only: :send_sns

  def send_sns
    SnsServices.new.send params['phone']
  end

end