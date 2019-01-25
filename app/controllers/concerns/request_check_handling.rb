module Concerns::RequestCheckHandling
  extend ActiveSupport::Concern

  def app_token_header
    request.headers['X-APP-TOKEN']
  end

  def session_id_header
    request.headers['X-SESSION-ID']
  end

  def check_session_id
    invalid_sesson_id unless User.exists?(loginSessionId: session_id_header)
    @user = User.find_by(loginSessionId: session_id_header)
  end

  def check_app_token_header
    return none_app_token_header if app_token_header.blank?
    invalid_app_token_header unless Security.app_token == app_token_header
  end

  def check_user
    @user = User.find_by(verifiedMobile: params['phone'])
    @user = User.find_by(nickname: params['phone']) if @user.blank?
    user_not_found if @user.blank?
  end

  def check_password
    invalid_password unless Security.encode_password(params['password'], @user.salt) == @user.password
  end
end
