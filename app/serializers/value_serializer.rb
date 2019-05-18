class ValueSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :reviews, serializer: ReviewSerializer
end
