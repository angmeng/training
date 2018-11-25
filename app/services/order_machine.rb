class OrderMachine
    attr_reader :menu_item, :quantity
    attr_accessor :order, :order_item, :message

    def initialize(order_id, user_id, menu_item_id, qty)
      @order_id     = order_id
      @user_id      = user_id
      @quantity     = qty.to_i
      @menu_item    = MenuItem.find menu_item_id
    end
    
    def valid?
        if quantity > 0
          true
        else
          false
        end
    end
    
    def ordering
      if valid?
        find_or_create_order
        update_or_create_order_item
        true
      else
        self.message = "You need a valid quantity"
        false  
      end
    end
    
    private
   
    def find_or_create_order
     user = Customer.find @user_id
     if @order_id.present?
       self.order = user.orders.find @order_id
     else
       order = Order.new(customer_id: @user_id)
       order.ordering_date = Date.today
       order.save
       self.order = order
     end 
    end
   
   def update_or_create_order_item
     self.order_item = order.order_items.find_by(menu_item_id: menu_item.id)
     if order_item.present?
       order_item.quantity += quantity.to_i
     else
       self.order_item = order.order_items.new
       order_item.menu_item_id = menu_item.id
       order_item.quantity = quantity
     end
     self.message = "You have just ordered #{quantity} of #{menu_item.name}"
     order_item.save
   end
    
end