class TimeTrialsController < ApplicationController
  $contestant1First = $contestant1Last = $contestant1Email = nil
  $contestant2First = $contestant2Last = $contestant2Email = nil
  $contestant3First = $contestant3Last = $contestant3Email = nil

  before_action :set_time_trial, only: [:show, :edit, :update, :destroy]

  def contestants
    $contestant1First = params["time_trial"]["contestant1First"]
    $contestant1Last = params["time_trial"]["contestant1Last"]
    $contestant1Email = params["time_trial"]["contestant1Email"]
    
    $contestant2First = params["time_trial"]["contestant2First"]
    $contestant2Last = params["time_trial"]["contestant2Last"]
    $contestant2Email = params["time_trial"]["contestant2Email"]
    
    $contestant3First = params["time_trial"]["contestant3First"]
    $contestant3Last = params["time_trial"]["contestant3Last"]
    $contestant3Email = params["time_trial"]["contestant3Email"]

    respond_to do |format|
      format.html { redirect_back fallback_location: { action: "index" }, notice: 'Time trial was successfully created.' }
      format.json { render :show, status: :created, location: @time_trial }
    end
  end

  def admin
    @time_trials = TimeTrial.all
  end

  # GET /time_trials
  # GET /time_trials.json
  def index
    @time_trials = TimeTrial.order(:time).limit(5)
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
    @time_trial.save
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
      format.html { redirect_to '/admin', notice: 'Time trial was successfully destroyed.' }
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
