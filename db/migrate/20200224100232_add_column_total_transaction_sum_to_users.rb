class AddColumnTotalTransactionSumToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :total_transaction_sum, :float, default: 0.0
  end
end
