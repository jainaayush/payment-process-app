class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum status: %i[inactive active]
  enum role: %i[admin merchant]

  has_many :merchants, foreign_key: 'admin_id', class_name: 'User'

  scope :admins, -> { where(role: 'admin') }
end
