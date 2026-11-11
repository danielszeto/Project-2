class Product < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy
  has_many :buyers, through: :transactions, source: :user

  validates :user, :category, :description, presence: true
  validates :product_url, format: { with: /\Ahttps?:\/\//i, message: "must be an HTTP(S) URL" }, allow_blank: true
end
