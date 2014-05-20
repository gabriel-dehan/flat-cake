class FlatsController < ApplicationController
  respond_to :js, :html

  def new
    @flat = Flat.new
  end

  def create
    flat = Flat.create(flat_params)
    flat.pictures.create(picture_params)

    redirect_to flat_path(flat)
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])

    @flat.update!(flat_params)
    @flat.pictures.create(picture_params)

    respond_with do |format|
      format.js
      format.html { redirect_to flat_path(flat) }
    end
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def picture_params
    params.require(:flat).permit(:file)
  end

  def flat_params
    params.require(:flat).permit(:title)
  end
end
