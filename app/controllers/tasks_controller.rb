class TasksController < ApplicationController
before_action :authenticate_user!
  def new
    @categories = Category.all
  end

  def create
    @task = Task.new(task_params)
    @category = Category.find(category_params)
    @task.category = @category
    puts "************test************"
    if @task.save
      respond_to do |format|
        format.html {
          puts "************test HTML************"
          redirect_to root_path
          flash[:notice] = "Task created"
        }
        format.js { 
          puts "************test JS************"
          puts "ok c'est bien au format JS" 
        }
      end
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
    
  end

  def edit
    @task = Task.find(params[:id])
    @categories = Category.all

  end

  def update
    @task = Task.find(params[:id])
    puts "*******direction ok vers put*****"
    puts params
    respond_to do |format|
      format.html { 
        puts "edition html"
        @task.update(task_params)
        redirect_to tasks_path
        flash[:notice] = "Task edited" }
      format.js { 
        puts "edition js"
        if @task.status == false
          @task.status = true
        else 
          @task.status = true
        end
        @task.save 
      }
    end
    
  end

  def index
    @tasks = Task.all
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end


  private

  def task_params
    params.permit(:title, :deadline, :description)
  end

  def category_params
    params.require(:Category)
  end

end
