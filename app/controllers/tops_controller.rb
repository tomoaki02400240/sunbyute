class TopsController < ApplicationController


  def index
  end
  
  def pref_index
    @prefecture = Prefecture.find(params[:id])
    
    if params[:name].present?
      @prefectures = Prefecture.where("name like ?", "%#{params[:name]}%")
    end
  end
    
  def show 
    @shop = Shop.find(params[:id])
  end
    
  
    
   
end
