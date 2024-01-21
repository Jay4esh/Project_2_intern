class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.string :description
      t.decimal :amount
      t.date :date
      t.date :start_date
      t.date :end_date
      t.string :source
      t.string :destination
      t.string :mode_of_transport
      t.string :status, default: "initiator"
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
