class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :records
  has_many :comments
  has_many :attaches
  has_many :questions

  validates :name, presence: true
  validates :position, presence: true
end
