class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Incorrectly (.. @ ... com)'}, uniqueness: {message: 'User with this email already exists'}
  validates :password, confirmation: {message: 'Do not match'}, length: { in: 6..20 }
  validates :password_confirmation, presence: true

  has_many :emails
end
