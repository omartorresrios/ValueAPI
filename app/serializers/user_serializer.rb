class UserSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :fcm_token, :job_description, :position, :department, :email, :avatar_url

  def avatar_url
    object.avatar_url
  end
end
