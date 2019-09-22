class Record < ApplicationRecord
  belongs_to :user
  belongs_to :subject

  validates :start, presence: true
  validates :end, presence: true
  validates :subject_id, presence: true
end
