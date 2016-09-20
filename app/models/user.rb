class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Incorrectly (.. @ ... com)'}, uniqueness: {message: 'User with this email already exists'}

  has_many :emails
  has_and_belongs_to_many :reports
end
