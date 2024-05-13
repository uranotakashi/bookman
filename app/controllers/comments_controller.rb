class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @book, notice: "Comment was successfully created."
    else
      render "books/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end