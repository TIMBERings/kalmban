class BoardsController < ApplicationController
  layout 'application'

  before_action :current_user

  def index
    puts "IN INDEX"
    @page_title = 'Boards'
    if @current_user
      @boards = @current_user.boards.sorted
    else
      permission_denied
    end
  end

  def show
    @board = Board.find(params[:id])
    permission_to_board?
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.user = current_user
    if @board.save
      flash[:notice] = "Board #{@board.title} created successfully."
      redirect_to(action: 'index')
    else
      render('new')
    end
  end

def edit
    @board = Board.find(params[:id])
    permission_to_board?
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @board = Board.find(params[:id])
    if @board.update_attributes(board_params)
      flash[:notice] = "Board #{@board.title} updated successfully."
      redirect_to(action: 'index')
    else
      render('edit')
    end
  end



  def delete
    @board = Board.find(params[:id])
    permission_to_board?
      respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    board = Board.find(params[:id]).destroy
    flash[:notice] = "Board #{board.title} is destroyed."
    redirect_to(action: 'index')
  end

  def sort  
    params[:board].each do |id|
      board = Board.find(id)
      board.position = params['board'].index(board.id.to_s) + 1
      board.save
    end

    render :nothing => true
  end 


  private
  
  def board_params
    params.require(:board).permit(:title, :description, :user_id, :open, :position)
  end

  def find_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end

  def permission_to_board?
    permission_denied if (!@board.nil?  && @board.user != @current_user)
  end

end

