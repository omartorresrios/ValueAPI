class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :department, serializer: DepartmentSerializer
  has_many :user, serializer: UserSerializer
  has_many :value, serializer: ValueSerializer
end
