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

	  if @product.save
			redirect_to user_path(current_user)
      else 
			render :new
	  end

  	end

  	def show
  		@product = Product.find(params[:id])
  		render :show

  	end

  private

  def user_params

  params.require(:product).permit(:description, :category, :available)
  
  end

end
