class Review < ApplicationRecord

  belongs_to :sender, class_name: 'User', foreign_key: 'from'
  belongs_to :receiver, class_name: 'User', foreign_key: 'to'


end
