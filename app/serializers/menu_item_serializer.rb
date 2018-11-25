class MenuItemSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  
  attributes :id, :name, :unit_price, :category_id, :position,
             :photo_url
  
  
  def photo_url
    
    if object.photo.attached?
      ActiveStorage::Current.set(host: "https://icode-angmeng.c9users.io") do
        object.photo.variant(resize: "100x100").processed.service_url
      end
      # rails_blob_path(object.photo, only_path: true)
    else
      ""  
    end
  end
  
end
