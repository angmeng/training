class LoginController < ApplicationController
  
  def new
  end
  
  def create
    customer = Customer.find_by(email: params[:email], password: params[:password])
    
    if customer.present?
        flash[:notice] = "You are signed in successfully"
        session[:user_id] = customer.id
        redirect_to orderings_path
     
    else
      flash[:alert] = "Emaill or password is incorrect"
      redirect_to action: :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are signed out succesffuly"
    redirect_to action: :new
  end
  
  def admin_login
  end
  
  def create_admin_session
    
    admin = Admin.find_by(email: params[:email], password: params[:password])
    
    if admin.present?
      flash[:notice] = "You are signed in as admin successfully"
      session[:admin_id] = admin.id
      redirect_to admins_path
    else
      flash[:alert] = "Emaill or password is incorrect"
      redirect_to action: :admin_login
    end
  end
  
  def destroy_admin_session
    session[:admin_id] = nil
    flash[:notice] = "You are signed out succesffuly"
    redirect_to action: :admin_login
  end
  
  
end
