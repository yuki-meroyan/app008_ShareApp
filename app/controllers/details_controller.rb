class DetailsController < ApplicationController
  before_action :set_genre, only: [:new]

  def index
    @details = Detail.all
  end


  def new
    @detail = Detail.new
    # @images = Image.new
    @detail.images.build
  end

  def create
    @detail = Detail.new(detail_params)
    

    
    if @detail.save
      params[:images][:image].each do |image|
        @detail.images.create(url: image, detail_id: @detail.id)
      end
    else
      @detail.images.build
      format.html{render action: 'new'}
    end

    binding.pry
    redirect_to root_path(genre_id: nil)
      
  end

  def show
    @detail = Detail.find(params[:id])
  end

  private

  def detail_params
    params.require(:detail).permit(:name, :place, :phone_number, :feature, :opentime, :closetime, :holiday, :recommendation, :average_use_price, :url, :note, :genre_id, images_attributes: [:image]).merge(user_id: current_user.id)
    
  end

  def set_genre
    @genres = Genre.all
  end

end
