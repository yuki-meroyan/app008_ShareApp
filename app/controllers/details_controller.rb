class DetailsController < ApplicationController
  # before_action :set_genre, only: [:create]

  def index
    @detail = Detail.new
    @genres = Genre.all
  end

  def create
    binding.pry
    @detail = Details.new(detail_params)
    @detail.save
  end

  private

  def detail_params
    # params.require(:detail).permit(:name, :place, :phone_number, :feature, :opentime, :closetime, :holiday, :recommendation, :average_use_price, :url, :note).merge(user_id: current_user.id)
    # params.require(:detail).permit(:name, :place, :phone_number, :feature, :opentime, :closetime, :holiday, :recommendation, :average_use_price, :url, :note, :genre_id)
    binding.pry
    params.require(:detail).permit(:name)
  end

  # def set_genre
  #   binding.pry
  #   @genre = Genre.find(params[:genre_id])
  # end

end
