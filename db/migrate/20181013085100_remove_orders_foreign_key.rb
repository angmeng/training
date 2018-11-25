class RemoveOrdersForeignKey < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key "order_items", "menu_items"
    remove_foreign_key "order_items", "orders"
  end
end
