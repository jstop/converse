class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]

### Custom Routes

  def subscribe
    @program = Program.find(params[:id])
    @tasks = []
    if signed_in?
      @program.sections.each do |section|
        @task = Task.new  
        @task.name = "#{@program.title} - #{section["title"]}"
        @task.duration = section["content_length_text"]
        #@task.description = section[""]
        @task.content = "https://udemy.com#{section["items"][0]["learn_url"]}"
        @task.user_id = current_user.id
        unless @task.save
          respond_to do |format|
            format.html { render :new }
            format.json { render json: @task.errors, status: :unprocessable_entity }
          end
          exit
        end
      end

      @program.add_subscriber current_user.id

      respond_to do |format|
        format.html { redirect_to @program, notice: 'Program was successfully created.' }
        format.json { render :show, status: :created, location: @program }
      end
    end
  end
  
####
  
  # GET /programs
  # GET /programs.json
  def index
    @programs = Program.all
  end

  # GET /programs/1
  # GET /programs/1.json
  def show
  end

  # GET /programs/new
  def new
    @program = Program.new
  end

  # GET /programs/1/edit
  def edit
  end

  # POST /programs
  # POST /programs.json
  def create
    @program = Program.new(program_params)

    respond_to do |format|
      if @program.save
        format.html { redirect_to @program, notice: 'Program was successfully created.' }
        format.json { render :show, status: :created, location: @program }
      else
        format.html { render :new }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programs/1
  # PATCH/PUT /programs/1.json
  def update
    respond_to do |format|
      if @program.update(program_params)
        format.html { redirect_to @program, notice: 'Program was successfully updated.' }
        format.json { render :show, status: :ok, location: @program }
      else
        format.html { render :edit }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programs/1
  # DELETE /programs/1.json
  def destroy
    @program.destroy
    respond_to do |format|
      format.html { redirect_to programs_url, notice: 'Program was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program
      @program = Program.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_params
      params.require(:program).permit(:payload)
    end
end
