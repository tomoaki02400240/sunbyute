class Shop::TopController < ApplicationController
 
<<<<<<< HEAD
  before_action :authorize_shop, only: [:dashboard, :update, :desc, :descprocess]
  before_action :correct_shop, only: [:dashboard, :update, :desc]
    #new actionはadministrator権限にする
=======
  before_action :authorize_shop, only: [:edit, :update]
  before_action :correct_user, only: [:dashboard]
    
>>>>>>> 1dc7385d28732438a05c4f5d553bec4f306a5f4e
    def new
      @shop = Shop.new
    end
    
    def create
<<<<<<< HEAD
      
      shop_img = params[:shop][:shop_img]
      if shop_img.present?
          @shop = Shop.new(shop_params.merge(shop_img: shop_img))
          if @shop.save
            login(@shop)
            flash[:success] = "成功しました"
            redirect_to shop_dashboard_path(@shop)
          else
            flash[:danger] = "だめ"
            redirect_to shop_new_path
          end
          
      else
          @shop = Shop.new(shop_params)
          if @shop.save
            flash[:success] = "店舗ページ作成"
            redirect_to shop_dashboard_path(@shop)
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
      @shop_desc = ShopDesc.new
    end
    
    def descprocess
      @shop_desc = ShopDesc.new(desc_params.merge(shop_id: current_shop.id))
      if @shop_desc.save
        flash[:success] = "店舗概要を作成しました"
        redirect_to show_path(current_shop)
      else
        flash[:danger] = "店舗概要を作成できませんでした"
        redirect_to shop_desc_path
      end
    end
    
    def imgprocess
      shop = Shop.find_by(id: current_shop.id)
      shop_img = params[:shop][:shop_img]
     if shop.update(shop_img: shop_img)
       flash[:success] = "画像を変更しました"
       redirect_to shop_dashboard_path(current_shop)
     else
       flash[:danger] = "画像を変更できませんでした"
       redirect_to shop_dashboard_path(current_shop)
     end
    end
    
    def desc_edit
      @shop_desc = ShopDesc.find(params[:id])
    end
    
    def desc_edit_process
      @shop_desc = ShopDesc.find_by(shop_id: current_shop.id)
      if @shop_desc.update(desc_params.merge(shop_id: current_shop.id))
        
        flash[:success] = "変更しました"
        redirect_to shop_dashboard_path(current_shop)
      else
        flash[:danger] = "変更できませんでした"
        redirect_to desc_edit_path(current_shop)
       
      end
    end
    
    def product
      @product = Product.new
    end
    
    def product_process
     
      product_img = params[:product][:product_image]
      if product_img.blank?
         @product = Product.new(product_params.merge(shop_id: current_shop.id))
        if @product.save
          flash[:success] = "登録しました（写真はデフォルト）"
          redirect_to shop_dashboard_path(current_shop)
        else
          flash[:danger] = "登録できませんでした"
          render 'product'
        end
      else
        @product = Product.new(product_params.merge(shop_id: current_shop.id, product_image: product_img))
        if @product.save
          flash[:success] = "登録しました"
          redirect_to shop_dashboard_path(current_shop)
        else
          flash[:danger] = "登録できませんでした"
          render 'product'
        end
      end
    end
    
    def product_delete
      @product = Product.find(params[:id])
      if @product.destroy
        flash[:success] = "削除しました"
        redirect_to shop_dashboard_path(current_shop)
      else
        flash[:danger] = "削除できませんでした"
        render 'dashboard'
      end
=======
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
>>>>>>> 1dc7385d28732438a05c4f5d553bec4f306a5f4e
    end
    
   
   
    private 
    
    def shop_params
<<<<<<< HEAD
      params.require(:shop).permit(:name, :email, :password, :password_confirmation, :prefecture_id, :city_id)
    end
    
    def desc_params
     params.require(:shop_desc).permit(:description, :shop_id)
    end
    
    def product_params
      params.require(:product).permit(:name, :description)
    end
=======
      params.require(:shop).permit(:name, :email, :password, :password_confirmation, :prefecture_id, :city_id, :shop_img)
    end
    
    def no_shop_params
      params.require(:shop).permit(:name, :email, :password, :password_confirmation, :prefecture_id, :city_id)
    end
    
>>>>>>> 1dc7385d28732438a05c4f5d553bec4f306a5f4e
    
    
   
end
