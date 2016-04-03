class PicturesController < ApplicationController
  before_action :find_picture, only: [:show, :edit, :update, :destroy]
  
  def index
    @pictures = Picture.all.order("created_at DESC")
  end
  
  def show
    
  end
  
  def new
    @picture = Picture.new
  end
  
  def create
    @picture = Picture.new(picture_params)

    if @picture.save
      flash[:notice] = "Post pic was saved"
      redirect_to @picture
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @picture.update(picture_params)
      flash[:notice] = "Post pic was edited"
      redirect_to @picture
    else
      render 'edit'
    end
  end
  
  private
  
  def picture_params
    params.require(:picture).permit(:title, :description)
  end
  
  def find_picture
    @picture = Picture.find(params[:id])
  end
  
end
