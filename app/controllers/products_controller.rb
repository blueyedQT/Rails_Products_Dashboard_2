class ProductsController < ApplicationController
  def index
  	@products = Product.joins("LEFT JOIN 'categories' ON categories.id = products.category_id").select('products.*, categories.name AS cat')
  end

  def show
  	@product = Product.joins("LEFT JOIN 'categories' ON categories.id = products.category_id").select('products.*, categories.name AS cat').find(params[:id])
  end

  def new
  	@product = Product.new
  	@errors = flash[:errors]
  end

  def edit
  	@product = Product.new
  	@p = Product.joins("LEFT JOIN 'categories' ON categories.id = products.category_id").select('products.*, categories.name AS cat, categories.id AS cat_id').find(params[:id])
  	@errors = flash[:errors]
  end

  def create
  	@product = params[:product]
  	@new = Product.new( product_params )
  	if @new.valid?
  		@new.save
  		redirect_to '/products'
  	else
  		puts @new.errors.full_messages
  		flash[:errors] = @new.errors.full_messages
  		redirect_to '/products/new'
  	end
  end

  def update
  	@update = Product.find(params[:id]).update( product_params )
  	puts product_params
  	if @update
  		redirect_to '/products/'+params[:id]
  	else
  		flash[:errors] = ['All fields must be filled out']
  		redirect_to '/products/'+params[:id]+'/edit'
  	end
  end

  def destroy
  	@destroy = Product.find(params[:id]).destroy
  	redirect_to '/products'
  end

  private
	def product_params
	  	params.require(:product).permit(:category_id, :name, :description, :pricing)
	end
  # end

end
