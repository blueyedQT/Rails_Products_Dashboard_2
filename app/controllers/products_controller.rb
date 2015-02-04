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
  	@product = Product.find(params[:id])
  	@errors = flash[:errors]
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
  	@update = Product.find(params[:id]).update( name: params[:name], description: params[:description], pricing: params[:pricing] )
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
end
