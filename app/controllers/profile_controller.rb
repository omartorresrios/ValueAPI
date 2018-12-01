class ProfileController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def profile
    @user = User.find_by(id: params[:id])
    render json: @user, serializer: UserSerializer, status: 201
  end

  def received_reviews
    if @user.present?
      render :json => @user.received_reviews.recent, status: 200
    else
      render json: { errors: ["User not found"] }, status: 422
    end
  end

  def sent_reviews
    if @user.present?
      render :json => @user.send_reviews.recent, status: 200
    else
      render json: { errors: ["User not found"] }, status: 422
    end
  end

  private
  
    def set_user
      @user = User.find_by(id: params[:id])
    end

end
