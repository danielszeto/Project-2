class User < ActiveRecord::Base
  has_many :products, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_many :purchased_products, through: :transactions, source: :product

  has_secure_password

  validates :first_name, :last_name, :age, :location, :bio, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { within: 6..40 }, allow_blank: true

  before_validation :normalize_email

  def self.confirm(params)
    user = User.find_by(email: params[:email].to_s.strip.downcase)
    user && user.authenticate(params[:password])
  end

  private

  def normalize_email
    self.email = email.to_s.strip.downcase
  end
end
