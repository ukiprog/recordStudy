class Belong < ApplicationRecord
  belongs_to :user

  validates :year, presence:true
  validates :class, presence:true
end
