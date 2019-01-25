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
    render json: {error: I18n.t("error.invalid_sesson_id")}, status: :bad_request
  end
end