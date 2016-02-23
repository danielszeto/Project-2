class User < ActiveRecord::Base

	has_many :transactions
  has_many :products, through: :transactions

	# has_many :products, through: :transactions

	has_secure_password

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :age, presence: true
	validates :location, presence: true
	validates :bio, presence: true
	validates :kind, presence: true
	validates :email, uniqueness: true

	validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40},
                       :on => :create
  	validates :password, :confirmation => true,
                       :length => {:within => 6..40},
                       :allow_blank => true,
                       :on => :update

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end
end
