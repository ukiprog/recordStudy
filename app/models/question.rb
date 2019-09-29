class Question < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  has_one :answer

  validates :question, presence: true
end
