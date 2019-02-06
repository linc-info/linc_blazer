module Concerns::SnsHandling
  extend ActiveSupport::Concern
  SNS_EXPIRED_SECONDS = 60

  def send_sns_code (phone)
    return sns_already_sent if check_sns_expired_at
    verification_code = generate_verification_code
    Aws::SNS::Client.new.publish(phone_number: phone.gsub('+',''), message: I18n.t('dic.sms_message', verification_code: verification_code))
    session[:verification_code] = verification_code
    session[:phone] = phone
    session[:verification_expired_at] = Time.zone.now.since(SNS_EXPIRED_SECONDS).to_i
  end

  private

  def generate_verification_code
    6.times.map {rand(10)}.join
  end

  def check_sns_expired_at
   session[:verification_expired_at].present? && session[:verification_expired_at] >= Time.zone.now.to_i
  end
end