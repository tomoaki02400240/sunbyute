class SearchParmacyController < ApplicationController
    def search_index
        
       if params[:commit].present?
         @prefectures = Prefecture.where("prefecture_id: ?", "params[:search][:id]")
         binding.remote_pry
       end
       
    end
end
