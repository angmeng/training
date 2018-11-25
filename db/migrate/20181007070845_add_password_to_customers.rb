class AddPasswordToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :password, :string
  end
end
