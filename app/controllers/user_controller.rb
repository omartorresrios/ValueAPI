class UserController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def update
	if @user.update(user_params)
	  render json: @user, status: 200
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:position, :job_description, :department)
    end

end