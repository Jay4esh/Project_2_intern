class AddExpenseTypeToExpenses < ActiveRecord::Migration[7.1]
  def change
    add_column :expenses, :expense_type, :string
  end
end
