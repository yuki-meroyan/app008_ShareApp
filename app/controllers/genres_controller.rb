class GenresController < ApplicationController
  before_action :set_pagename, only: [:index]


  def index
    @details = Detail.page(params[:page]).per(9)
  end

  def new
  end

  def show
    @genre = Genre.find(params[:id])
    @details = Detail.where(genre_id: params[:id]).page(params[:page]).per(9)
    # binding.pry
  end
  
  def create
  end

  private

  # def set_genre
  #   if Detail.where(genre_id: params[:genre_id])
  #     @details = Detail.where(genre_id: params[:genre_id]).paginate(page: params[:page], per_page: 5)
  #   end
  # end

  def set_pagename
    if params[:genre_id] == nil
      @page_name = "ALL's PAGE"
    else
      genre = Genre.where(id: params[:genre_id])
      @page_name = genre[0].name + "'s PAGE"
    end
  end
end
