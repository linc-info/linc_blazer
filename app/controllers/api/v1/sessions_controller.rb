class Api::V1::SessionsController < Api::V1::ApiController
  before_action :check_user, only: :create
  before_action :check_password, only: :create
  before_action :check_session_id, only: :destroy

  def create
    @user.update_session_id
    render json: {session_id: @user.loginSessionId, nickname: @user.nickname}
  end

  def destroy
    @user.update_session_id
  end
end