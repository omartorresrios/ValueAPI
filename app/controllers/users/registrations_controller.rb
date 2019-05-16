class Users::RegistrationsController < ApplicationController
  # POST '/api/users/signup'
  # BODY: {
  #   email: String,
  #   fullname: String,
  #   password: String
  # }
  def create
    user = User.new(user_params)
    if user.save
      render json: user, serializer: CurrentUserSerializer, status: 201
    else
      render json: { errors: user.errors.full_messages }, status: 422
    end
  end

  def all_companies
    @companies = Company.all
  	render json: @companies, status: 200
  end

  def all_departments
    @company = Company.find_by(id: params[:id])
    @departments = @company.departments
  	render json: @departments, status: 200
  end

  private

    def user_params
      params.permit(:fullname, :email, :fcm_token, :is_admin, :job_description, :position, :department_id, :company_id, :password, :avatar)
    end
end
