class CommentsController < ApplicationController
  def index
  	@comments = Comment.joins(:product).select('comments.comment, products.name AS product_name')
  end

  def new
  	@comment = Comment.new
  end

  def create
  	@comment = params[:comment]
  	@id = @comment[:id].to_i
  	@new = Comment.create(comment:@comment[:comment], product_id:@id)
  	if @new.valid?
  		redirect_to '/comments'
  	else
  		render :text => 'You failed!'
  	end
  end
end
