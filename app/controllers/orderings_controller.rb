#orderings controller
class OrderingsController < ApplicationController
  before_action :authenticate_user, except: [ :index ]
  
  def index
    @categories = Category.order("name DESC")
  end
  
  def order

    
    order_machine = OrderMachine.order(session[:order_id], session[:user_id], params[:menu_item_id],  params[:quantity] )

                                     
    if order_machine.valid? && order_machine.ordering
      session[:order_id] = order_machine.order.id
      flash[:notice] = "you have just order #{order_machine.menu_item.name}"
    else
      flash[:alert] = "You need a valid quantity"

    end
    
    redirect_to action: :index
  end

    if order_machine.ordering
        session[:order_id] = order_machine.order.id

  def checkout
    @order = Order.find(session[:order_id])
    if @order.order_items.blank?
      flash[:alert] = "You have to order item first"
      redirect_to orderings_path
    end
      
  end
    end