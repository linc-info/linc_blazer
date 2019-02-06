module Concerns::ErrorResponseHandling
  extend ActiveSupport::Concern

  def none_app_token_header
    render json: {error: I18n.t("error.none_app_token_header")}, status: :bad_request
  end

  def invalid_app_token_header
    render json: {error: I18n.t("error.invalid_app_nonce_header")}, status: :bad_request
  end

  def user_not_found
    render json: {error: I18n.t("error.user_not_found")}, status: :bad_request
  end

  def invalid_password
    render json: {error: I18n.t("error.invalid_password")}, status: :bad_request
  end

  def invalid_sesson_id
    render json: {error: I18n.t("error.invalid_sesson_id")}, status: :unauthorized
  end

  def invalid_phone_format
    render json: {error: I18n.t("error.invalid_phone_format")}, status: :bad_request
  end

  def phone_already_exist
    render json: {error: I18n.t("error.phone_already_exist")}, status: :bad_request
  end

  def sns_already_sent
    render json: {error: I18n.t("error.sns_already_sent")}, status: :bad_request
  end

  def invalid_nickname_format
    render json: {error: I18n.t("error.invalid_nickname_format")}, status: :bad_request
  end

  def nickname_already_exist
    render json: {error: I18n.t("error.nickname_already_exist")}, status: :bad_request
  end

  def invalid_password_format
    render json: {error: I18n.t("error.invalid_password_format")}, status: :bad_request
  end

  def invalid_signature
    render json: {error: I18n.t("error.invalid_signature")}, status: :bad_request
  end

  def invalid_verification_code
    render json: {error: I18n.t("error.invalid_verification_code")}, status: :bad_request
  end

end