class ValueSerializer < ActiveModel::Serializer
  attributes :id, :name

  belongs_to :company, serializer: CompanySerializer
end
