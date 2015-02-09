require_relative 'base_api_controller'
class Api::TasksController < BaseApiController
  before_action :find_board
  def index
    render :json => @board.tasks
  end

  def show
    render :json => @board.tasks.where(id: params[:task_id])
  end

  def create
  end

  def update
  end

  def destroy
  end
private
  def find_board
    puts params.inspect
    @board = Board.find(params[:board_id]) if params[:board_id]
  end
end
