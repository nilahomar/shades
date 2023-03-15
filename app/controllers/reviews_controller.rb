class ReviewsController < ApplicationController
  def create
  end

  private

  def review_params
    params.require(:review).permit[:content, :rating, :product_id]
  end
end
