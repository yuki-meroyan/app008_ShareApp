class DetailsController < ApplicationController
  before_action :set_genre, only: [:new]

  def index
    @details = Detail.all
  end


  def new
    @detail = Detail.new
  end

  def create
    @detail = Detail.new(detail_params)
    @detail.save
    redirect_to root_path(genre_id: nil)
  end

  def show
    @detail = Detail.find(params[:id])
  end

  private

  def detail_params
    params.require(:detail).permit(:name, :place, :phone_number, :feature, :opentime, :closetime, :holiday, :recommendation, :average_use_price, :url, :note, :genre_id).merge(user_id: current_user.id)
    
  end

  def set_genre
    @genres = Genre.all
  end

end
