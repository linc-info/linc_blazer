module Validations
  class EmailValidator < ActiveModel::Validator
    REGEXP = /\A[^@]+@[^@]+\z/

    def validate(record)
      value = record.email
      return record.errors.add(:email, :blank) if value.nil?
      record.errors.add(:email, :invalid) unless value.to_s.match?(REGEXP)
    end
  end
end

