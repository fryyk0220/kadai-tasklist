class TasksController < ApplicationController
  before_action :set_tasks, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end
  
  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(filter_params)
    
    if @task.save
      flash[:success] = "タスクは正常に登録されました"
      redirect_to @task
    else
      flash[:danger] = "タスクは登録されませんでした"
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @task.update(filter_params)
      flash[:success] = "タスクは正常に更新されました"
      redirect_to @task
    else
      flash[:danger] = "タスクは更新されませんでした"
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    
    flash[:success] = "タスクは正常に削除されました"
    redirect_to tasks_url
  end
  
  private
  
  def filter_params
    params.require(:task).permit(:content,:status)
  end
  
  def set_tasks
    @task = Task.find(params[:id])
  end
  
end
