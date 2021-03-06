module SessionsHelper
  def login(s)
      session[:user_id] = s.id
     # binding.remote_pry
    end
    
    def current_shop
      @current_shop ||= Shop.find_by(:id => session[:user_id])
      #binding.remote_pry
    end
    
    def authorize_shop
      #binding.remote_pry
      
      redirect_to root_path unless logged_in_shop?
    end
    
    def logged_in_shop?
      !!current_shop
    end
    
    def correct_shop
      @shop = Shop.find_by(id: params[:id])
      unless @shop.id === current_shop.id
        redirect_to shop_dashboard_path(current_shop)
      end
    end
    
    def shop_log_out
      session.delete(:user_id)
      @current_shop = nil
    end
end
