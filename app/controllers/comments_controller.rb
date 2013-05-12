class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_entry, only: [:create]

  def create
    @comment = @entry.comments.build(params[:comment].merge(:user => current_user ))
    if @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to @entry
    else
      flash[:alert] = "Comment has not been created."
      render :template => "entries/show"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back, :notice => "Comment has been deleted"
  end

  private

  def find_entry
    @entry = Entry.find(params[:entry_id])
  end

end
