class ProductsController < ApplicationController

	def index
		@products = Product.new
	end

	def new
		@product = Product.new
		render :new
	end

	def create
    @product = Product.new(user_params)
    @product.users.push(current_user)
    # TODO: associate's the product with the current as the creator
    # @product.user = current_user
	  if @product.save
			redirect_to user_path(current_user)
    else 
			render :new
	  end

    # @product.users.push(current_user)
    # redirect_to user_path(current_user)

  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(user_params)
    redirect_to user_path
  end

	def show
		@product = Product.find(params[:id])
		render :show
	end

  # def regular
  #   @product = Product.find(params[:id])
  #   if product.category == "regular"
  #   end

  # end

  # def organic
  # end

  # def glutonfree
  # end

  # def vegan
  # end



  private

  def user_params

  params.require(:product).permit(:description, :category, :available)
  
  end

end
