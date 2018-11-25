class PaymentsController < ApplicationController
  
  def new
    @order = Order.find session[:order_id]
    
  end
  
  def create
    
    @order = Order.find session[:order_id]
    @order.is_checked_out = true
    @order.save
    flash[:notice] = "Order confirmed, Payment make successfully"
    session[:order_id] = nil
    redirect_to orderings_path
  end

end
