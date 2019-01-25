module Validations
  class PhoneValidator < ActiveModel::Validator
    CN_PHONE_REGEXP = /\A[+]86\d{11}\z/
    JP_PHONE_REGEXP = /\A[+]81\d{10}\z/
    FAKE_PHONE_REGEXP = /\A[+]999\d{10}\z/
    PHONE_REGEXP = Regexp.union(CN_PHONE_REGEXP, JP_PHONE_REGEXP, FAKE_PHONE_REGEXP)

    def validate(record)
      value = record.verifiedMobile
      return record.errors.add(:verifiedMobile, :blank) if value.nil?
      record.errors.add(:verifiedMobile, :invalid) unless value.to_s.match?(PHONE_REGEXP)
    end
  end
end