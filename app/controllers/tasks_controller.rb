class TasksController < ApplicationController
  before_action :find_board
  before_action :current_user, :logged_in?

  def index
      @tasks = @board.tasks
      permission_denied if (@board.user != @current_user)
  end

  def show
    if (!@board.nil?  && @board.user != @current_user)
      permission_denied 
    else
      @task = Task.find(params[:id])

      respond_to do |format|
        format.html
        format.js
      end   
    end
  end

  def new
    if (!@board.nil?  && @board.user != @current_user)
      permission_denied 
    else
      @task = Task.new

      respond_to do |format|
        format.html
        format.js
      end   
    end
  end

  def create
    @task = Task.new(task_params)
    @task.board = @board
    if @task.save
      flash[:notice] = "Task '#{@task.title}' created successfully."
      redirect_to board_tasks_path(@task.board)
    else
      render('new')
    end
  end

  def edit
    @task = Task.find(params[:id])
    if permission_to_task?
      respond_to do |format|
        format.html
        format.js
      end   
    end
  end

  def update
    @task = Task.find(params[:id])
    puts "Params #{task_params}"
    @task.update_attributes(task_params)
    if @task.save
      flash[:notice] = "Task '#{@task.title}' updated successfully."
      redirect_to board_tasks_path(@task.board)
    else
      render('edit')
    end
  end

  def delete
    @task = Task.find(params[:id])
    if permission_to_task?
      respond_to do |format|
        format.html
        format.js
      end   
    end
  end

  def destroy
    task = Task.find(params[:id]).destroy
    flash[:notice] = "Task '#{task.title}' deleted successfully."
      redirect_to board_tasks_path(task.board)
  end

  def sort  
    puts "Params #{params}"
    params[:task].each do |id|
      task = Task.find(id)
      task.position = params['task'].index(task.id.to_s) + 1
      task.save
    end

    render :nothing => true
  end 

  private
  def task_params
    params.require(:task).permit(:position, :title, :board_id, :status, :description, :due_date, :completed_date)
  end

  def find_board
    @board = Board.find(params[:board_id]) if params[:board_id]
  end

  def permission_to_task?
    if (!@task.nil?  && @task.board.user != @current_user) 
      permission_denied 
      return false
    else
      return true
    end
  end
end
