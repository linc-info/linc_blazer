class Api::V1::SignController < Api::V1::ApiController
  before_action :check_user, only: :sign_in
  before_action :check_password, only: :sign_in
  before_action :check_session_id, only: :sign_out

  def sign_up

  end

  def sign_in
    @user.update_session_id
    render json: {session_id: @user.loginSessionId, nickname: @user.nickname}
  end

  def sign_out
    @user.update_session_id
    head :ok
  end
end