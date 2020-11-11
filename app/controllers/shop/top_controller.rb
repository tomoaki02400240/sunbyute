class Shop::TopController < ApplicationController
 
  before_action :authorize_shop, only: [:edit, :update]
  before_action :correct_user, only: [:edit]
    
    def new
      @shop = Shop.new
    end
    
    def create
    if params[:shop][:shop_img].present?
        @shop = Shop.new(shop_params.merge(:shop_img => params[:shop][:shop_img]))
        if @shop.save
          login(@shop)
          flash[:success] = "登録しました"
          redirect_to show_path(@shop)
        else
          flash[:danger] = "登録できませんでした"
          redirect_to shop_new_path
        end
    else
      @shop = Shop.new(shop_params)
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
    
    def edit
      @shop = Shop.find(params[:id])
      @shop_contents = ShopContent.new
    end
    
    # ShopContentModel create_action
    def make
      @shop_contents = ShopContent.new(make_params.merge(shop_id: current_shop.id))
      unless @shop_contents.save
        redirect_to shop_dashboard_path(current_shop)
      end
    end
    private 
    
    def shop_params
      params.require(:shop).permit(:name, :email, :password, :password_confirmation, :prefecture_id, :city_id)
    end

    def make_params
      params.require(:shop_content).permit(:description)
    end

    
    
   
end
