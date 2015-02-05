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
  	@comment = Comment.create(comment:@comment[:comment], product_id:@id)
    redirect_to '/products/' + params[:comment][:id]
  end
end
