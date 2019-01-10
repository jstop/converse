class TimeTrialsController < ApplicationController
  before_action :set_time_trial, only: [:show, :edit, :update, :destroy]

  # GET /time_trials
  # GET /time_trials.json
  def index
    @time_trials = TimeTrial.all
  end

  # GET /time_trials/1
  # GET /time_trials/1.json
  def show
  end

  # GET /time_trials/new
  def new
    @time_trial = TimeTrial.new
  end

  # GET /time_trials/1/edit
  def edit
  end

  # POST /time_trials
  # POST /time_trials.json
  def create
    @time_trial = TimeTrial.new(time_trial_params)

    respond_to do |format|
      if @time_trial.save
        format.html { redirect_to @time_trial, notice: 'Time trial was successfully created.' }
        format.json { render :show, status: :created, location: @time_trial }
      else
        format.html { render :new }
        format.json { render json: @time_trial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_trials/1
  # PATCH/PUT /time_trials/1.json
  def update
    respond_to do |format|
      if @time_trial.update(time_trial_params)
        format.html { redirect_to @time_trial, notice: 'Time trial was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_trial }
      else
        format.html { render :edit }
        format.json { render json: @time_trial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_trials/1
  # DELETE /time_trials/1.json
  def destroy
    @time_trial.destroy
    respond_to do |format|
      format.html { redirect_to time_trials_url, notice: 'Time trial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_trial
      @time_trial = TimeTrial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_trial_params
      params.require(:time_trial).permit(:firstname, :lastname, :email, :time)
    end
end
