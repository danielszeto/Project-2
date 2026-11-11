class Product < ActiveRecord::Base
  belongs_to :user
  has_many :transactions, dependent: :destroy
  has_many :buyers, through: :transactions, source: :user

  validates :user, :category, :description, presence: true
end
