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
  end
end
