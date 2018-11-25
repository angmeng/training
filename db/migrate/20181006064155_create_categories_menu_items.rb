class CreateCategoriesMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_menu_items, id: false do |t|
      t.belongs_to :category, index: true
      t.belongs_to :menu_item, index: true
    end
  end
end
