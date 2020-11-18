class Shop::TopController < ApplicationController
 
  before_action :authorize_shop, only: [:edit, :update]
  before_action :correct_user, only: [:dashboard]
    
    def new
      @shop = Shop.new
    end
    
    def create
    if params[:shop][:shop_img].present?
        @shop = Shop.new(shop_params)
        if @shop.save
          login(@shop)
          flash[:success] = "登録しました"
          redirect_to show_path(@shop)
        else
          flash[:danger] = "登録できませんでした!!!"
          redirect_to shop_new_path
        end
    else
      @shop = Shop.new(no_shop_params)
      if @shop.save
        login(@shop)
        flash[:success] = "登録しました"
        redirect_to show_path(@shop)
      else
        flash.now[:danger] = "登録できませんでした"
        redirect_to shop_new_path
      end
    end
    
    end
    
    def dashboard
      @shop = Shop.find(params[:id])
      @shop_contents = ShopContent.new
    end
    
   
   
    private 
    
    def shop_params
      params.require(:shop).permit(:name, :email, :password, :password_confirmation, :prefecture_id, :city_id, :shop_img)
    end
    
    def no_shop_params
      params.require(:shop).permit(:name, :email, :password, :password_confirmation, :prefecture_id, :city_id)
    end
    
    
    
   
end
