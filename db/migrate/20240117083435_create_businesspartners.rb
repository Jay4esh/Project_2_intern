class CreateBusinesspartners < ActiveRecord::Migration[7.1]
  def change
    create_table :businesspartners do |t|
      t.string :customer_code
      t.string :customer_name
      t.integer :corporate_number
      t.integer :invoice_number
      t.integer :postal_code
      t.string :address
      t.integer :telephone_number

      t.timestamps
    end
  end
end
