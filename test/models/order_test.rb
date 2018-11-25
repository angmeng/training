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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
