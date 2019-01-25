module Validations
  class NicknameValidator < ActiveModel::Validator
    JAPANESE_REGEXP = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々]|[A-Za-z0-9_()·.])+\z/
    CHINESE_REGEXP = /\A[\u4E00-\u9FA5A-Za-z0-9_()·.]+\z/
    REGEXP = Regexp.union(JAPANESE_REGEXP, CHINESE_REGEXP)

    def validate(record)
      value = record.nickname
      return record.errors.add(:nickname, :blank) if value.nil?
      record.errors.add(:nickname, :invalid) unless value.to_s.match?(REGEXP)
    end
  end
end
