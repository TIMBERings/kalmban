require_relative 'base_controller'

module Api
  class BoardsController < Api::BaseController
    def board_params
      params.require(:board).permit(:title, :description, :user_id, :open, :position)
    end

    def query_params
      params.permit(:user_id, :title, :description)
    end
  end
end
