class ReviewController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  require 'fcm'

  def create
    review = Review.create_review(@user, current_user, review_params)
    if review.save
      render json: review, serializer: ReviewSerializer, status: 200

      

      send_notification(review.receiver.fcm_token, review.sender.fullname)

    else
      render json: { errors: review.errors.full_messages }, status: 422
    end
  end

  def send_notification(fcm_token, sender_fullname)
    fcm_client = FCM.new('AAAAbdY0wog:APA91bFfk3FurxxHY-xbxPqnEKGJLEM7aXW-nNmxgtFd97mISAXuNwZdllWh9wrSX6pA92-Yc2JI-r1I3ugn9etBNKUOmVo7IsrI8R4BH_80wp9tQVV0Mash9YN4-9fREPg9Oljro4gR')

    options = {
                priority: 'high',
                data: {
                  message: 'Hola por ahí'
                },
                notification: {
                  title: 'Nueva reseña dude!',
                  body: sender_fullname + 'de dejó una reseña!',
                  sound: 'default'
                }
              }

    user_device_id = fcm_token

    response = fcm_client.send(user_device_id, options)
    Rails.logger.debug("Notification response: #{response}")

  end

  private

    def review_params
      params.permit(:body)
    end

    def set_user
      @user = User.find_by(id: params[:id])
    end
end