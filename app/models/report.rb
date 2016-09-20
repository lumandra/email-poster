class Report < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :emails

  validates :email_to, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Incorrectly (.. @ ... com)'}, uniqueness: {message: 'User with this email already exists'}
end
