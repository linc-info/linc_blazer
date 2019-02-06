class Api::V1::NotificationController < Api::V1::ApiController
  include Concerns::Api::V1::NotificationControllerDoc
  include Concerns::SnsHandling
  before_action :check_phone_format, only: :send_sns
  before_action :check_phone_exist, only: :send_sns

  def send_sns
    send_sns_code params['phone']
  end

end