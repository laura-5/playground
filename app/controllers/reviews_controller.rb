class ReviewsController < ApplicationController
  def new
    @activite = Activite.find(params[:activite_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @activite = Activite.find(params[:activite_id])
    @review.activite = @activite
    if @review.save
      redirect_to activite_path(@activite)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to activite_path(@review.activite)
  end

  private

  def review_params
    params.require(:review).permit(:content, :stars)
  end

end
