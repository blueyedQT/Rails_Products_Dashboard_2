class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  end

  def new
  	@errors = flash[:errors]
  end

  def edit
  end

  def create
  	@new = Product.new( name: params[:name], description: params[:description], pricing: params[:pricing] )
  	if @new.valid?
  		@new.save
  		redirect_to '/products'
  	else
  		flash[:errors] = @new.errors.full_messages
  		redirect_to '/products/new'
  	end
  end

  def update
  end

  def destroy
  end
end
