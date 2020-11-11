class Shop::TopController < ApplicationController
 
  before_action :authorize_shop, only: [:edit, :update]
   
    
    def new
      @shop = Shop.new
    end
    
    def create
      @shop = Shop.new(shop_params)
      if @shop.save
        login(@shop)
        flash[:success] = "成功しました"
        redirect_to show_path(@shop)
      else
        flash[:danger] = "だめ"
        redirect_to shop_new_path
      end
      
    end
    
    def edit
      @shop = Shop.find(params[:id])
    end
    
    
    private 
    
    def shop_params
      params.require(:shop).permit(:name, :email, :password, :password_confirmation, :prefecture_id, :city_id, :shop_img)
    end
    
   
end
