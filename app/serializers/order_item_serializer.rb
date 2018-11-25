class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity
  
  belongs_to :menu_item
end
