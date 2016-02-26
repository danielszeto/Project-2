class UsersController < ApplicationController

  def index
	end

  def new
		@user = User.new
		render :new
	end

	def create
	  @user = User.new(user_params)

	  if @user.save
	  	# sign in user
	  	session[:user_id] = @user.id
			redirect_to @user
     else
     	p "ERRORS: #{@user.errors.full_messages.to_sentence}"
			render :new
	  end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update_attributes(user_params)
  	redirect_to	user_path
  end

	def show
		@user = User.find(params[:id])
    # TODO: get the user's products & pass them to the view
    # @products = @user.products
		render :show
	end


	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :age, :location, :bio, :kind, :file)
 	end
end