require_relative 'base_api_controller'

class Api::BoardsController < BaseApiController
  def index
    render :json => Board.all
  end

  def show
    render :json => Board.find(params['board_id'])
  end

  def create
  end

  def update
  end

  def destroy
  end
end
