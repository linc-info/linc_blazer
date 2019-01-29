class Api::V1::UsersController < Api::V1::ApiController
  include Concerns::Api::V1::UsersControllerDoc
  before_action :check_phone_format, only: %i[create check]
  before_action :check_phone_exist, only: %i[create check]
  before_action :check_nickname_format, only: %i[create check]
  before_action :check_nickname_exist, only: %i[create check]
  before_action :check_password_format, only: %i[create check]

  def create

  end

  def check;end
end