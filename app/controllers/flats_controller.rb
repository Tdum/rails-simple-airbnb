class FlatsController < ApplicationController
  before_action :find_flat, only: [ :show, :create, :edit, :update, :destroy ]

  def index         # GET /flats
    @flats = Flat.all
  end

  def show          # GET /flats/:id
  end

  def new
    @flat = Flat.new         # GET /flats/new
  end

  def create
    @flat = Flat.new(flat_params)  # POST /flats
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit          # GET /flats/:id/edit
  end

  def update
      if @flat.update(flat_params)
        redirect_to flat_path(@flat)
      else
        render :edit
      end
    end        # PATCH /flats/:id
  end

  def destroy       # DELETE /flats/:id
    @flat.destroy
    redirect_to flats_path
  end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
