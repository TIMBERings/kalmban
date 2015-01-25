class BoardsController < ApplicationController
  layout 'application'

before_action :find_user

  def index
    @page_title = 'Boards'
    if @user
      @boards = @user.boards
    else
      @boards = Board.all
    end
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      flash[:notice] = "Board #{@board.title} created successfully."
      redirect_to(action: 'show', id: @board.id)
    else
      render('new')
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    if @board.update_attributes(board_params)
      flash[:notice] = "Board #{@board.title} updated successfully."
      redirect_to(action: 'show', id: @board.id)
    else
      render('edit')
    end
  end

  def delete
    @board = Board.find(params[:id])
  end

  def destroy
    board = Board.find(params[:id]).destroy
    flash[:notice] = "Board #{board.title} is destroyed."
    redirect_to(action: 'index')
  end


  private
  
  def board_params
    params.require(:board).permit(:title, :description, :user_id, :open, :position)
  end

  def find_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end

end
