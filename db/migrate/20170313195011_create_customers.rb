class CreateCustomers < ActiveRecord::Migration[5.0]

  def change
    enable_extension("citext")
    
    create_table :customers do |t|
      t.citext :first_name
      t.citext :last_name

      t.timestamps
    end
  end
end
