class ProductsController < ApplicationController

	def index
    if params[:type]
      @products = Product.where(category: params[:type])
    else
		  @products = Product.all
    end
    render :index
	end

	def new
		@product = Product.new
		render :new
	end

	def create
    @product = Product.new(user_params)
    @product.users.push(current_user)
    @product.user = current_user
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
    updated_params = params.require(:product).permit(:description, :category, :available)
    @product = Product.find(params[:id])
    @product.update_attributes(updated_params)
    redirect_to current_user
  end

	def show
		@product = Product.all
		
	end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to current_user
  end

  def regular
    @product = Product.find(params[:id])
    render :re

  end

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
