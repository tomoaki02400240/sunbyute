class SessionsController < ApplicationController
  def new
  end
  
  def create
    @shop = Shop.find_by(email: params[:sessions][:email].downcase)
    if @shop && @shop.authenticate(params[:sessions][:password])
      login(@shop)
      flash[:success] = "ログインしました"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def destroy
  end
end
