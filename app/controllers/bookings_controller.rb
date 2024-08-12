class BookingsController < ApplicationController
  before_action :set_offer, only: [:destroy]

  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)

    if @offer.save
      redirect_to @offer
    else
      render :new
    end
  end

  def destroy
    @offer.destroy
    redirect_to offers_url, status: :see_other
  end
end
