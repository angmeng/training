# == Schema Information
#
# Table name: categories
#
#  id          :bigint(8)        not null, primary key
#  name        :string(255)      not null
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  position    :integer          default(0)
#

class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    
    has_many :menu_items
    #has_and_belongs_to_many :menu_items
    
    # after_save :output_name
    
   
end
