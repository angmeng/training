class ApplicationController < ActionController::Base
    
    helper_method :current_user
    def current_user
       if session[:user_id].present?
         Customer.find(session[:user_id])
       else
         nil
       end
    end
    
    helper_method :current_admin
    def current_admin
      if session[:admin_id].present?
         Admin.find(session[:admin_id])
      else
         nil
      end
    end
    
    helper_method :display_name
    def display_name
      if current_user.present?
        current_user.name
      elsif current_admin.present?
        current_admin.name
      end
    end
    
    def authenticate_user
       if session[:user_id].present?
          
       else
         flash[:alert] = "Please sign in first before continue"
         redirect_to login_path
       end
    end
    
    def authenticate_admin
       if session[:admin_id].present?
          
       else
         flash[:alert] = "Please sign in first before continue"
         redirect_to login_path
       end
        
    end
end
