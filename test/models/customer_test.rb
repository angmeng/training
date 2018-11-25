# == Schema Information
#
# Table name: customers
#
#  id             :bigint(8)        not null, primary key
#  name           :string(255)      not null
#  address        :text(65535)
#  email          :string(255)
#  contact_number :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  password       :string(255)
#

require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
