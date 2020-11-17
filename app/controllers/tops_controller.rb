class TopsController < ApplicationController
  def index
  end

  def pref_index
    @prefecture = Prefecture.find(params[:id])
  end

  def show
    @shop = Shop.find(params[:id])
  end
end
