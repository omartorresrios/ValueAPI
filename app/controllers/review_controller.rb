class ReviewController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def create
    review = Review.create_review(@user, current_user, review_params)
    if review.save
      render json: review, serializer: ReviewSerializer, status: 200
      # render json: review, status: 201
    else
      render json: { errors: review.errors.full_messages }, status: 422
    end
  end

  private

    def review_params
      params.permit(:body)
    end

    def set_user
      @user = User.find_by(id: params[:id])
    end
end