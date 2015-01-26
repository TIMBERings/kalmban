class TasksController < ApplicationController
  before_action :find_board

  def index
    if @board
      @tasks = @board.tasks
    else
      @tasks = Task.all
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
    respond_to do |format|
      format.js
    end   
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "Task '#{@task.title}' created successfully."
      redirect_to action: :show, id: @task.id
    else
      render('new')
    end
  end

  def edit
    @task = Task.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(task_params)
    if @task.save
      flash[:notice] = "Task '#{@task.title}' updated successfully."
      redirect_to action: :show, id: @task.id
    else
      render('edit')
    end
  end

  def delete
    @task = Task.find(params[:id])
  end

  def destroy
    task = Task.find(params[:id]).destroy
    flash[:notice] = "Task '#{task.title}' deleted successfully."
    redirect_to(action: 'index')
  end

  private
  def task_params
    params.require(:task).permit(:position, :title, :board_id, :status, :description, :due_date, :completed_date)
  end

  def find_board
    @board = Board.find(params[:board_id]) if params[:board_id]
  end
end
