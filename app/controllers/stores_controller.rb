class StoresController < ApplicationController
  before_action :set_genre, only: [:index]

  def index

  end
  
  def show
  end

  private
  def set_genre
    if params[:genre_id] == nil
      @page_name = "ALL's PAGE"
    else
      genre = Genre.where(id: params[:genre_id])
      @page_name = genre[0].name + "'s PAGE"
    end
  end

end
