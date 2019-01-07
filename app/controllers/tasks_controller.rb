class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # POST /tasks/complete
  def complete
    @task = Task.find(params[:id])
    @task.completed = true
    @task.completed_time = DateTime.now

    @log = TimeLog.new
    @log.task_id = params[:id]
    @log.datetime = DateTime.now
    @log.log = "#{@task.name} - Complete"
    @log.user = current_user if signed_in? 
    
    respond_to do |format|
      if @log.save and @task.save
        format.html { redirect_back fallback_location: { action: "index"}, notice: 'Task Completed' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /tasks
  # GET /tasks.json
  def index
      @open_tasks = Task.where(completed: nil)
      @closed_tasks = Task.where(completed: true)
      @time_logs = current_user.time_logs
    if params[:today]
      @tasks = Task.where(completed: nil, deadline: Date.yesterday..Date.tomorrow)
    else
      @tasks = Task.all
    end
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    #task_params[:categories].reject!(&:empty?)
    @task = Task.new(task_params)
    @task.user = current_user if signed_in?

    respond_to do |format|
      if @task.save
        format.html { redirect_back fallback_location: { action: "index"}, notice: 'Task created!' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
   # task_params[:categories] = task_params[:categories].reject!(&:empty?)
    puts task_params[:categories]
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_back fallback_location: { action: "index"}, notice: 'Task Updated!' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: { action: "index"}, notice: 'Task Destroyed' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :duration, :date_time, :description, :content, :deadline, :due_date, :category_ids => [])
    end
end
