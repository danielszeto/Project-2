class SessionsController < ApplicationController

	def new
    @user = User.new
    render :new
  end

  def create

    @user = User.confirm(user_params)
    if @user
      login(@user)
      redirect_to "/users/#{@user.id}"
    else
			#OPTIMIZE: you can use @user.errors.full_messages here to have active record dynamically display the correct message
    	flash[:danger] = 'Invalid email/password combination' # Not quite right!
      redirect_to "/sign_in"
    end
  end

  def destroy
  	logout
  	redirect_to "/sign_in"
  end

  private

  def user_params
  params.require(:user).permit(:email, :password)
	end
end
