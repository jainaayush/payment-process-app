class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :status
      t.string :type
      t.string :uuid
      t.float :amount, default: 0.0
      t.string :customer_email
      t.string :customer_phone
      t.integer :reference_id
      t.integer :merchant_id

      t.timestamps
    end
  end
end
