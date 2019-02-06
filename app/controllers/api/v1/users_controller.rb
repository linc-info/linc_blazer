class Api::V1::UsersController < Api::V1::ApiController
  include Concerns::Api::V1::UsersControllerDoc
  before_action :check_phone_format, only: %i[create check reset_password]
  before_action :check_phone_exist, only: %i[create check]
  before_action :check_nickname_format, only: %i[create check]
  before_action :check_nickname_exist, only: %i[create check]
  before_action :check_password_format, only: %i[create check reset_password]
  before_action :check_signature, only: :create
  before_action :check_verification_code, only: %i[create reset_password]

  def create
    render json: User.sign_up(params['phone'], params['nickname'], params['password'])
  end

  def reset_password
    User.find_by(verifiedMobile: params['phone']).update_password(params['password'])
  end

  def check;end
end