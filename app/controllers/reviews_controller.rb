class ReviewsController < ApplicationController

  def create
    @user = current_user
    @offer = Offer.find(params[:offer_id])
    @review = Review.new(review_params)
    @review.user = @user
    @review.offer = @offer
    if @review.save
      # Si l'offre n'a pas encore de note (première review)
      if @offer.rating.nil?
        new_rating = @review.rating
      else
        # Calculer la nouvelle note moyenne
        new_rating = ((@offer.rating * @offer.reviews.count) + @review.rating) / (@offer.reviews.count + 1)
      end

      # Mettre à jour la colonne rating de l'offre
      @offer.update(rating: new_rating)

      # Rediriger avec un message de succès
      redirect_to offer_path(@offer), notice: "Votre review a été créée avec succès."
    else
      # Renvoyer le formulaire avec les erreurs
      render :new, status: :unprocessable_entity
    end
  end

  def new

  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
