class Product < ActiveRecord::Base
	belongs_to :user

	has_many :users, through: :transactions

	validates :category, presence: true
	validates :description, presence: true
	
end
