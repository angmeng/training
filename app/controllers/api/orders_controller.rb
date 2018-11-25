class Api::OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    # should we move this code to order_items controller ?
    
    order = Order.find_by(customer_id: session[:user_id], is_checked_out: false)
    if order.present?
      session[:order_id] = order.id
      render json: order.order_items
    else
      session[:order_id] = nil
      render json: []
    end
  end
  
end
  