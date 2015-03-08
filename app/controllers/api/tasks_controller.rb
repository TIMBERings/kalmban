require_relative 'base_controller'

module Api
  class TasksController < Api::BaseController
 
    def task_params
      params.require(:task).permit(:position, :title, :board_id, :status, :description, :due_date, :completed_date)

    end

    def query_params
      params.permit(:title, :board_id, :status, :description)
    end
  end
end
