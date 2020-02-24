class TransactionDeleteJob < ApplicationJob
  queue_as :default

  def perform
    transactions = Transaction.last_two_hours
    transactions.destroy_all
  end
end
