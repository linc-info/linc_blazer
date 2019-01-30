module Concerns::RequestCheckHandling
  extend ActiveSupport::Concern

  def app_token_header
    request.headers['X-APP-TOKEN']
  end

  def session_id_header
    request.headers['X-SESSION-ID']
  end

  def nonce_header
    request.headers['X-NONCE']
  end

  def signature_header
    request.headers['X-SIGNATURE']
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
    user_not_found if @user.blank?
  end

  def check_password
    invalid_password unless Security.encode_password(params['password'], @user.salt) == @user.password
  end

  def check_phone_format
    invalid_phone_format unless params['phone'].present? && params['phone'].to_s.match?(Validations::PhoneValidator::PHONE_REGEXP)
  end

  def check_phone_exist
    phone_already_exist if User.exists?(verifiedMobile: params['phone'])
  end

  def check_nickname_format
    invalid_nickname_format unless params['nickname'].present? && params['nickname'].to_s.match?(Validations::NicknameValidator::NICKNAME_REGEXP)
  end

  def check_nickname_exist
    nickname_already_exist if User.exists?(nickname: params['nickname'])
  end

  def check_password_format
    invalid_password_format unless params['password'].present? && params['password'].to_s.match?(User::PASSWORD_REGEXP)
  end

  def check_signature
    invalid_signature unless Security.verify?(nonce_header, signature_header)
  end
end
