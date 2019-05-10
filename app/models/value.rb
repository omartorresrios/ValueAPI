class Value < ApplicationRecord
	belongs_to :company
	has_many :valueings, dependent: :destroy
	has_many :reviews, through: :valueings
end
