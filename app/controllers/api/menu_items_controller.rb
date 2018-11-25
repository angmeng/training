class Api::MenuItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_token, except: [:index]
  
  def index
    if params[:category_id].present?
      menu_items = MenuItem.with_attached_photo.where(category_id: params[:category_id]).order(:position)
    else
      menu_items = MenuItem.with_attached_photo.joins(:category).order("categories.position, menu_items.position")
    end
    render json: menu_items
  end
  
  def create
    order_machine = OrderMachine.new(session[:order_id], session[:user_id], params[:menu_item_id],  params[:quantity] )
                                     
    # if order_machine.valid?
    if order_machine.ordering
      session[:order_id] = order_machine.order.id
      # message = "you have just order #{order_machine.menu_item.name}"
      render json: order_machine.order_item
    else
      # message = "You need a valid quantity"
      render json: { message: order_machine.message }, status: 422
    end
    
  end
  
  
  private
  
  def authenticate_token
    unless session[:user_id].present?
      render json: { message: "Please sign in first" }, status: 401
    end
  end
  
  
end
