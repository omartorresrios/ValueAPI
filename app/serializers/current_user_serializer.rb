class CurrentUserSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :authentication_token, :email, :job_description, :position, :department, :fullname, :avatar_url

  def authentication_token
    JsonWebToken.encode({ user_id: object.id })
  end
end
