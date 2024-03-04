class SearchesController < ApplicationController
  def search
    @range = params[:range]
    
    if @range == "User"
      @records = User.looks(params[:search], params[:word])
    else
      @records = PostImage.looks(params[:search], params[:word])
    end
  end
end
