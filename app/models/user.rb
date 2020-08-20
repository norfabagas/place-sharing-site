class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :places, dependent: :destroy
  has_many :follows

  validates :name, presence: true
  validates :username, presence: true, format: { with: /\A[A-Za-z0-9]+\z/, message: "only accept alphanumeric format" }
end
