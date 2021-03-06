class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy, :approve]
  before_action :find_blog
  before_action :find_entry

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.entry = @entry if @entry

    respond_to do |format|
      if @comment.save
        CommentMailer.posted(@comment).deliver

        format.html { redirect_to [@blog, @entry], notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to [@blog, @entry], notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approve
    @comment.approve
    redirect_to blog_entry_path(@blog, @entry)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_blog
      @blog = Blog.find(params[:blog_id])
    end

    def find_entry
      @entry = Entry.find(params[:entry_id])
    end
end
