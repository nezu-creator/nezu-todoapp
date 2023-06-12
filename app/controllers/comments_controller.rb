class Commentscontroller < ApplicationController
  def new
    task = Task.find(paramus[:task_id])
    @comment = task.comments.build
  end

  def create
    task = Task.rind(params[:task_id])
    @comment = task.comments.build(comment_params)
    if @comment.save
      redirect_to board_task_path(board), notice: 'コメントを追加'
    else
      flash.now[:error] = '更新できませんでした'
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end