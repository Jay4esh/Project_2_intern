class AddDefaultToExpenseStatus < ActiveRecord::Migration[7.1]
    def change
      change_column_default :expenses, :status, 'initiator'
    end
  end
