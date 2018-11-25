class OrderItemMachine
    attr_accessor :message
    

    def initialize(order_item:, situation_id:, input_quantity: 0)
      @order_item = order_item
      @situation_id = situation_id
      @input_quantity = input_quantity
    end
    
    def manage_quantity
    
      case @situation_id
      when 1
        @order_item.quantity += 1
        @order_item.save
        self.message = "You have increase 1 #{@order_item.menu_item.name}"
      when 2
        @order_item.quantity -= 1
        if @order_item.quantity == 0
          @order_item.destroy
          self.message = "You have remove #{@order_item.menu_item.name}"
        else
          @order_item.save
          self.message = "You have decrease 1 #{@order_item.menu_item.name}"
        end
      when 3
        if @input_quantity.to_i > 0
          @order_item.quantity = @input_quantity
          @order_item.save
          self.message = "You have update #{@order_item.menu_item.name}'s quantity"
        else
          # if input_quantity less than 1
          @order_item.destroy
          self.message = "You have remove #{@order_item.menu_item.name}"
        end 
      end
  
    end
    
    
end