class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at, :from, :to

  has_many :values, :foreign_key => 'value_id', serializer: ValueSerializer
  belongs_to :sender, :class_name => 'User', :foreign_key => 'from', serializer: UserSerializer
  belongs_to :receiver, :class_name => 'User', :foreign_key => 'to', serializer: UserSerializer
end
