json.extract! order, :id, :ordering_date, :customer_id, :remark, :created_at, :updated_at
json.url order_url(order, format: :json)
