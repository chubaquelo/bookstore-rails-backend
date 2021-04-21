class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_and_set_user, only: [:destroy, :create]

  def index
    @products = Product.all

      respond_to do |format|
        format.json { render :json => @products }
      end
  end

  def show
  end

  def create
    begin
      @new_product = Product.new(product_params)
      @new_product.save

      respond_to do |format|
        format.json { render :json => { 
          result: "Product created.",
          id: @new_product.id
          }
        }
      end
    rescue => exception
      respond_to do |format|
        e = { result: "Not found or not allowed." }
        format.json { render :json => e }
      end
    end
  end

  def destroy
    begin
      @product = Product.find(params[:id])
      @product.destroy
      respond_to do |format|
        format.json { render :json => { result: "product deleted." } }
      end
    rescue => exception
      respond_to do |format|
        e = { result: "Not found or not allowed." }
        format.json { render :json => e }
      end
    end
  end

  def update
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :material)
  end

end
