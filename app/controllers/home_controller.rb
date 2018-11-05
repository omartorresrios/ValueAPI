class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
  	@reviews = Review.all
  	render json: @reviews, status: 200
  end
  
end