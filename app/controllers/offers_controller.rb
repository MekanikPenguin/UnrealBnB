class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  def index
    @offers = Offer.all
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def edit
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    if @offer.save!
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @offer.user_id = 1
    if @offer.update(offer_params)
      redirect_to @offer
    else
      render :edit
    end
  end

  def destroy
    @offer.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end
  def offer_params
    params.require(:offer).permit(:name, :address, :price, :description)
  end

end
