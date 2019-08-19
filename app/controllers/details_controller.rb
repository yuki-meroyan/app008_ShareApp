class DetailsController < ApplicationController
  before_action :set_genre, only: [:index, :new]

  def index
    @detail = Detail.new
  end

  def new
    @detail = Detail.new
  end

  def create
    @detail = Detail.new(detail_params)
    # @detail.save
  end

  private

  def detail_params
    binding.pry
    params.require(:detail).permit(:name, :place, :phone_number, :feature, :opentime, :closetime, :holiday, :recommendation, :average_use_price, :url, :note).merge(user_id: current_user.id)
    
  end

  def set_genre
    @genres = Genre.all
  end

end
