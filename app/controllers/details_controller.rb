class DetailsController < ApplicationController
  before_action :set_genre, only: [:new]

  def index
    @details = Detail.all
  end


  def new
    @detail = Detail.new
    # @images = Image.new
    @detail.photos.build
  end

  def create
    @detail = Detail.new(detail_params)
    
    
    
    if @detail.save
      # if @detail.photos
      #   @detail.photos[0].image.each do |photo|
      #     if photo != nil
      #       binding.pry
      #       Photo.create(image: photo, name: photo.filename, detail_id: @detail.id)
      #     end
      #   end
      # end
    else
      @detail.photos.build
      format.html{render action: 'new'}
    end

    redirect_to root_path(genre_id: nil)
      
  end

  def show
    @detail = Detail.find(params[:id])
    @photos = Photo.find_by(detail_id: 55)
    # binding.pry
    # @image = @detail.images[0].image[0].file.file
    # binding.pry
  end

  private

  def detail_params
    params.require(:detail).permit(:name, :place, :phone_number, :feature, :opentime, :closetime, :holiday, :recommendation, :average_use_price, :url, :note, :genre_id, photos_attributes: {image: []}).merge(user_id: current_user.id)
    # params.require(:detail).permit(:name, :place, :phone_number, :feature, :opentime, :closetime, :holiday, :recommendation, :average_use_price, :url, :note, :genre_id, images_attributes: [:image]).merge(user_id: current_user.id)
    
  end

  def set_genre
    @genres = Genre.all
  end

end
