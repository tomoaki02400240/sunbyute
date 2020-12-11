class Shop::ShopContentsController < ApplicationController
  def des
    @shop_contents = ShopContent.new
    @shop = Shop.find(params[:id])
  end

  def create
    @shop_content = ShopContent.new(des_params.merge(shop_id: current_shop.id))
    if @shop_content.save
      flash[:success] = "店舗説明作成しました"
      redirect_to show_path(current_shop)
    else
      flash[:danger] = "店舗説明が作成されませんでした"
      redirect_to shop_des_path(current_shop)
    end
  end

  def edit
    @shop_content = ShopContent.find(params[:id])

  end
    
  def update
    @shop_content = ShopContent.find(params[:id])
    if @shop_content.update(edit_params.merge(shop_id: current_shop.id))
      flash[:success] = "店舗説明編集しました"
      redirect_to show_path(current_shop)  
    else
      flash[:danger] = "店舗説明の編集が失敗しました"
      redirect_to shop_des_edit_path(@shop_content) 
    end
  
  end  

  def avatar
    @shop_avatar = ShopAvatar.new
  end

  def avatar_process
    avatar = params[:shop][:avatar]
    if avatar.present?
      @shop_avatar = ShopAvatar.new(avatar_params.merge(shop_id: current_shop.id))
        if @shop_avatar.save?
          flash[:success] = "写真を掲載しました"
          redirect_to show_path(current_shop)
        else
          flash[:danger] = "写真を掲載できませんでした"
          redirect_to shop_avatar_path
        end
    else
      redirect_to show_path(current_shop)
    end
  end
  private

  def des_params
    params.permit(:description)
  end

  def edit_params
    params.require(:shop_content).permit(:description)
  end

  def avatar_params
    params.require(:shop_avatar).permit(:avatar)
  end
end
