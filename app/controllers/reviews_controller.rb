class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy]

  def create
    @user = current_user
    @offer = Offer.find(params[:offer_id])
    @review = Review.new(review_params)  # Utiliser `Review` avec une majuscule
    @review.user = @user
    @review.offer = @offer

    if @review.save
      if @offer.rating
        # Calculer la nouvelle note avant d'incrémenter le nombre de reviews
        new_rating = ((@offer.rating * @offer.reviews.count) + @review.rating) / (@offer.reviews.count + 1)
      else
        new_rating = @review.rating
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

  def set_review
    @review = Review.find(params[:id])
  end
end
