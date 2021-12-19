# frozen_string_literal: true

###
# asfasfas fas fasf
###
class Diary < ApplicationRecord
  enum kind: [:public_kind, :private_kind]
  has_many :notes, dependent: :destroy
  validates :title, :kind, presence: true
  validates :kind, inclusion: { in: Diary.kinds, message: '%{ value } is not includet in the list' }
  validate :validate_expiration

  def validate_expiration
    errors.add(:expiration, "can't be in the past") if expiration <= Time.now
  end
end
