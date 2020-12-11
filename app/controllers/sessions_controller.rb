class SessionsController < ApplicationController
  def new
  end
  
  def create
    @shop = Shop.find_by(email: params[:sessions][:email].downcase)
    # binding.remote_pry
    if @shop && @shop.authenticate(params[:sessions][:password])
      #binding.remote_pry
      login(@shop)
      flash[:success] = "ログインしました"
      redirect_to shop_dashboard_path(@shop)
    else
      render 'new'
    end
    
  end
  
  def destroy
<<<<<<< HEAD
    session.delete(:user_id)
    @current_shop = nil
    flash[:success] = "ログアウトしました"
    redirect_to root_path
=======
    shop_log_out
    redirect_to root_path
    flash.now[:danger] = "ログアウトしました"
>>>>>>> 1dc7385d28732438a05c4f5d553bec4f306a5f4e
  end
end
