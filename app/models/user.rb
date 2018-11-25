# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  full_name  :string(255)
#  email      :string(255)
#  password   :string(255)
#  is_admin   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
    has_many :orders
end
