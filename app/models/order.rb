# == Schema Information
#
# Table name: orders
#
#  id             :bigint(8)        not null, primary key
#  ordering_date  :date
#  customer_id    :bigint(8)
#  remark         :text(65535)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  is_checked_out :boolean          default(FALSE)
#

class Order < ApplicationRecord
  belongs_to :customer
  
  has_many :order_items
  has_many :menu_items, through: :order_items
  
  validates :customer, presence: true
  
  def total_amount
    total = 0.0
    order_items.each do |order_item|
      total += order_item.quantity * order_item.menu_item.unit_price
    end
    total
  end
  
end
