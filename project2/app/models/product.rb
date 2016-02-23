class Product < ActiveRecord::Base
	belongs_to :user
	has_many :transactions
  has_many :users, through: :transactions

	validates :category, presence: true
	validates :description, presence: true
	
  # add a `user_id` attribute so they can belong to the user

end
