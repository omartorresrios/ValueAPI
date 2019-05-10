class UserSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :fcm_token, :is_admin, :job_description, :position, :email, :avatar_url, :send_reviews_count, :received_reviews_count

  belongs_to :company, serializer: CompanySerializer
  belongs_to :department, serializer: DepartmentSerializer

  def avatar_url
    object.avatar_url
  end
end
