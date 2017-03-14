class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    enable_extension("citext")

    create_table :transactions do |t|
      t.references :invoice, foreign_key: true
      t.string :credit_card_number
      t.citext :result

      t.timestamps
    end
  end
end
