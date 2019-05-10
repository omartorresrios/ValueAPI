class AdminController < ApplicationController

  def departments_that_most_recognize
    @total_send_reviews ||= 0
    @data_array = []

    @company = Company.find_by(id: params[:id])
    @departments = @company.department
    @departments.each do |dpt|

      @users = dpt.user
      @users.each do |user|
        @total_send_reviews += user.send_reviews.count
      end

      @data_array << {:label => dpt.name, :value => @total_send_reviews}
      @total_send_reviews = 0
    end
    render json: @data_array, status: 200
  end

  def departments_most_recognize

    @total_received_reviews ||= 0
    @data_array = []

    @company = Company.find_by(id: params[:id])
    @departments = @company.department
    @departments.each do |dpt|

      @users = dpt.user
      @users.each do |user|
        @total_received_reviews += user.received_reviews.count
      end

      @data_array << {:label => dpt.name, :value => @total_received_reviews}
      @total_received_reviews = 0
    end
    render json: @data_array, status: 200
  end

  def employees_who_most_recognize
    @total_send_reviews ||= 0
    @data_array = []

    @company = Company.find_by(id: params[:id])
    @users = @company.user.order("send_reviews_count DESC").all
    @users.limit(5).each do |user|
      @total_send_reviews += user.send_reviews.count
      @data_array << {:empleado => user.fullname, :departamento => user.department.name, :reviews => @total_send_reviews}
      @total_send_reviews = 0
    end
    render json: @data_array, status: 200
  end

  def employees_most_recognize
    @total_received_reviews ||= 0
    @data_array = []

    @company = Company.find_by(id: params[:id])
    @users = @company.user.order("received_reviews_count DESC").all
    @users.limit(5).each do |user|
      @total_received_reviews += user.received_reviews.count
      @data_array << {:empleado => user.fullname, :departamento => user.department.name, :reviews => @total_received_reviews}
      @total_received_reviews = 0
    end
    render json: @data_array, status: 200
  end

  def number_of_reviews_by_value
    @total_reviews ||= 0
    @data_array = []

    @company = Company.find_by(id: params[:id])
    @values = @company.value.all
    @values.each do |value|
      @total_reviews += value.reviews.count
      @data_array << {:label => value.name, :value => @total_reviews}
      @total_reviews = 0
    end

    render json: @data_array, status: 200
  end

  def number_of_reviews
    @company = Company.find_by(id: params[:id])
    @reviews = @company.total_reviews_count
    render json: @reviews, status: 200
  end

  def total_employees_who_recognized
    @total_employees_who_recognized ||= 0

    @company = Company.find_by(id: params[:id])
    @total_employees_who_recognized = @company.total_empl_who_recognized_counter
    render json: @total_employees_who_recognized, status: 200
  end

  def total_employees_that_where_recognized
    @total_employees_that_where_recognized ||= 0

    @company = Company.find_by(id: params[:id])
    @total_employees_that_where_recognized = @company.total_empl_that_were_recognized_counter
    render json: @total_employees_that_where_recognized, status: 200
  end

  def initialize_vars
    @users = nil
  end

end
