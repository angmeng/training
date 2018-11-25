# == Schema Information
#
# Table name: menu_items
#
#  id          :bigint(8)        not null, primary key
#  name        :string(255)      not null
#  unit_price  :decimal(8, 2)    default(0.0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint(8)
#  position    :integer          default(0)
#

require 'test_helper'

class MenuItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
