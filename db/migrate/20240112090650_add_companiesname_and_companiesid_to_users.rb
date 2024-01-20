class AddCompaniesnameAndCompaniesidToUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :companies_id, :integer
  end
end
