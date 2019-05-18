class AdminController < ApplicationController
  
  # Last month
  def departments_that_most_recognize
    @total_send_reviews ||= 0
    @data_array = []

    @company = Company.find_by(id: params[:id])
    @departments = @company.departments
    @departments.each do |dpt|

      @users = dpt.user
      @users.each do |user|
        @total_send_reviews += user.send_reviews.last_month.count
      end

      @data_array << {:label => dpt.name, :value => @total_send_reviews}
      @total_send_reviews = 0
    end
    render json: @data_array, status: 200
  end

  # Last month
  def departments_most_recognize

    @total_received_reviews ||= 0
    @data_array = []

    @company = Company.find_by(id: params[:id])
    @departments = @company.departments
    @departments.each do |dpt|

      @users = dpt.user
      @users.each do |user|
        @total_received_reviews += user.received_reviews.last_month.count
      end

      @data_array << {:label => dpt.name, :value => @total_received_reviews}
      @total_received_reviews = 0
    end
    render json: @data_array, status: 200
  end

  # Last month
  def employees_who_most_recognize
    @total_send_reviews ||= 0
    @data_array = []

    @company = Company.find_by(id: params[:id])
    @users = @company.users.order("send_reviews_count DESC").all
    @users.limit(5).each do |user|
      @total_send_reviews += user.send_reviews.last_month.count
      @data_array << {:empleado => user.fullname, :departamento => user.department.name, :reviews => @total_send_reviews}
      @total_send_reviews = 0
    end
    render json: @data_array, status: 200
  end

  # Last month
  def employees_most_recognize
    @total_received_reviews ||= 0
    @data_array = []

    @company = Company.find_by(id: params[:id])
    @users = @company.users.order("received_reviews_count DESC").all
    @users.limit(5).each do |user|
      @total_received_reviews += user.received_reviews.last_month.count
      @data_array << {:empleado => user.fullname, :departamento => user.department.name, :reviews => @total_received_reviews}
      @total_received_reviews = 0
    end
    render json: @data_array, status: 200
  end

  # Last month
  def number_of_reviews_by_value
    @total_reviews ||= 0
    @data_array = []

    @company = Company.find_by(id: params[:id])
    @values = @company.values.all
    @values.each do |value|
      @total_reviews += value.reviews.last_month.count
      @data_array << {:label => value.name, :value => @total_reviews}
      @total_reviews = 0
    end

    render json: @data_array, status: 200
  end

  # Last month
  def number_of_reviews
    @company = Company.find_by(id: params[:id])
    @reviews = @company.reviews.last_month.count
    render json: @reviews, status: 200
  end

  # Last month
  def total_employees_who_recognized
    @total_employees_who_recognized ||= 0
    @ids_array = []

    @company = Company.find_by(id: params[:id])
    @reviews = @company.reviews.last_month
    @reviews.each do |review|
      if !(@ids_array.include?(review.sender.id))
        if review.sender.send_reviews_count > 0
          @total_employees_who_recognized += 1
          @ids_array << review.sender.id
        end
      end
    end
    render json: @total_employees_who_recognized, status: 200
  end

  # Last month
  def total_employees_that_were_recognized
    @total_employees_that_were_recognized ||= 0
    @ids_array = []

    @company = Company.find_by(id: params[:id])
    @reviews = @company.reviews.last_month
    @reviews.each do |review|
      if !(@ids_array.include?(review.receiver.id))
        if review.receiver.received_reviews_count > 0
          @total_employees_that_were_recognized += 1
          @ids_array << review.receiver.id
        end
      end
    end
    render json: @total_employees_that_were_recognized, status: 200
  end

  def initialize_vars
    @users = nil
  end

end
