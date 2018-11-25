class AddCategoryReferencesToMenuItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :menu_items, :category, foreign_key: true
  end
end
