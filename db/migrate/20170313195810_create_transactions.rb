class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :invoice, foreign_key: true
      t.string :credit_card_number
      t.string :result

      t.timestamps
    end
  end
end
