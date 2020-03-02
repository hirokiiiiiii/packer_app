class BoardsController < ApplicationController
  def index
    #@boards = params[:tag_id].present? ? Tag.find(params[:tag_id]).boards : Board.all
    @q = Board.ransack(params[:q])
    @tags = Tag.all
    @boards = @q.result(distinct: true).page(params[:page])
    #@boards = params[:tag_id].present? ? Tag.find(params[:tag_id]).boards : Board.all
    
  end

  def show
    @board = Board.find(params[:id])
    @comment = Comment.new(board_id: @board.id)
  end

  def new
    @board = Board.new
  end

  def edit
    @board = Board.find(params[:id])
  end
  
  def update
    board = Board.find(params[:id])
    board.update!(board_params)
    redirect_to boards_url, notice: "投稿「#{board.title}」を更新しました。"
  end
  
  def create
    @board = current_user.boards.new(board_params)
    if @board.save
      redirect_to @board, notice: "タスク「#{@board.title}」を登録しました。"
    else
      render :new
    end
  end
  
  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to boards_url, notice: "タスク「#{@board.title}」を削除しました。"
  end
  
  private
  
  def board_params
    params.require(:board).permit(:title, :context, tag_ids: [])
  end
end

