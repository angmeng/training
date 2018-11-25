class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.text :address
      t.string :email
      t.string :contact_number

      t.timestamps
    end
  end
end
