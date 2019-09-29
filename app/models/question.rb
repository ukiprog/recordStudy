class Question < ApplicationRecord
  belongs_to :user
  belongs_to :subject

  validates :question, presence: true
end
