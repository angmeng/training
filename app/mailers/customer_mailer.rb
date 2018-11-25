class CustomerMailer < ApplicationMailer
    
    def welcome_email(customer_id, order_id)
       @order = Order.find order_id
       @customer = Customer.find customer_id  
       attachments["sample.jpg"] = File.read("#{Rails.root}/app/assets/images/deadpool.jpg")
       mail(to: @customer.email, subject: 'Welcome to My Awesome Site')
    end
end

