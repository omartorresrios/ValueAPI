class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name
  
  has_many :departments, serializer: DepartmentSerializer
  has_many :users, serializer: UserSerializer
  has_many :values, serializer: ValueSerializer
end
