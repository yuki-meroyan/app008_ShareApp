class DetailsController < ApplicationController
  before_action :set_genre, only: [:create]

  def new
    @detail = Detail.new
    @genres = Genre.all
  end

  def create
    @detail = @genre.details.new(detail_params)
    binding.pry
    @detail.save
  end

  private

  def detail_params
    params.require(:detail).permit(:name, :place, :phone_number, :feature, :opentime, :closetime, :holiday, :recommendation, :average_use_price, :url, :note).merge(user_id: current_user.id)
  end

  def set_genre
    @genre = Genre.find(params[:genre_id])
  end

end
