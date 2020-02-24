class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum status: %i[inactive active]
  enum role: %i[admin merchant]

  has_many :merchants, foreign_key: 'admin_id', class_name: 'User'
  has_many :transactions, foreign_key: 'merchant_id', class_name: 'Transaction'

  scope :admins, -> { where(role: 'admin') }

  before_destroy :check_associated_transaction

  private

    def check_associated_transaction
      if transactions&.length >= 0
        errors.add(:base, 'Can not be deleted as transactions present')
      end
    end
end
