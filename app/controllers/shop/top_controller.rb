class Shop::TopController < ApplicationController
 
  before_action :authorize_shop, only: [:dashboard, :update, :desc, :descprocess]
   
    
    def new
      @shop = Shop.new
    end
    
    def create
      
      shop_img = params[:shop][:shop_img]
      if shop_img.present?
          @shop = Shop.new(shop_params.merge(shop_img: shop_img))
          if @shop.save
            login(@shop)
            flash[:success] = "成功しました"
            redirect_to show_path(@shop)
          else
            flash[:danger] = "だめ"
            redirect_to shop_new_path
          end
          
      else
          @shop = Shop.new(shop_params)
          if @shop.save
            flash[:success] = "店舗ページ作成"
            redirect_to show_path(@shop)
          else
            flash[:danger] = "作成できませんでした"
            redirect_to shop_new_path
          end
          
      end
    end
    
    def dashboard
      @shop = Shop.find(params[:id])
    end
    
    def desc
      @shop_desc = ShopDesc.new(desc_params)
    end
    
    def descprocess
      @shop_desc = ShopDesc.new(desc_params.merge(shop_id: current_shop.id))
    binding.remote_pry
      if @shop_desc.save
        flash[:success] = "店舗概要を作成しました"
        redirect_to show_path(current_shop)
      else
        flash[:danger] = "店舗概要を作成できませんでした"
        redirect_to shop_desc_path
      end
      
    end
    
    
    private 
    
    def shop_params
      params.require(:shop).permit(:name, :email, :password, :password_confirmation, :prefecture_id, :city_id)
    end
    
    def desc_params
      params.require(:shop_desc).permit(:description,:shop_id)
    end
    
   
end
