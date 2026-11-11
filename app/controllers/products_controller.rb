class ProductsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :require_owner, only: [:edit, :update, :destroy]

  def index
    @products = Product.includes(:user).order(created_at: :desc)
    if params[:type].present?
      @products = @products.where('LOWER(category) = ?', params[:type].to_s.downcase)
    end
  end

  def new
    @product = current_user.products.build
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to user_path(current_user), notice: 'Listing created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to user_path(current_user), notice: 'Listing updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to user_path(current_user), notice: 'Listing deleted.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def require_owner
    head :forbidden unless @product.user_id == current_user.id
  end

  def product_params
    params.require(:product).permit(:description, :category, :available, :product_url)
  end
end
