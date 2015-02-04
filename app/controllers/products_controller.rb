class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  end

  def new
  	@product = Product.new
  	@errors = flash[:errors]
  end

  def edit
  	@product = Product.new
  	@p = Product.find(params[:id])
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
	  	params.require(:product).permit(:name, :description, :pricing)
	end
  # end

end
