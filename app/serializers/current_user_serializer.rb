class CurrentUserSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :authentication_token, :fcm_token, :is_admin, :email, :job_description, :position, :fullname, :avatar_url

  belongs_to :company, serializer: CompanySerializer
  belongs_to :department, serializer: DepartmentSerializer


  def authentication_token
    JsonWebToken.encode({ user_id: object.id })
  end
end
