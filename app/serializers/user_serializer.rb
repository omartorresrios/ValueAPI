class UserSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :job_description, :email, :avatar_url

  def avatar_url
    object.avatar_url
  end
end
