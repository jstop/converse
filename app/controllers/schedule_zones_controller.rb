class ScheduleZonesController < ApplicationController
  before_action :set_schedule_zone, only: [:show, :edit, :update, :destroy]

  def index
    @schedule_zones = ScheduleZone.all
  end
  def show
  end

  def new
    @schedule_zone = ScheduleZone.new
  end

  def edit
  end

  def create
    @schedule_zone = ScheduleZone.new(schedule_zone_params)

    respond_to do |format|
      if @schedule_zone.save
        format.html { redirect_to @schedule_zone, notice: 'Schedule zone was successfully created.' }
        format.json { render :show, status: :created, location: @schedule_zone }
      else
        format.html { render :new }
        format.json { render json: @schedule_zone.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @schedule_zone.update(schedule_zone_params)
        format.html { redirect_to @schedule_zone, notice: 'Schedule zone was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule_zone }
      else
        format.html { render :edit }
        format.json { render json: @schedule_zone.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @schedule_zone.destroy
    respond_to do |format|
      format.html { redirect_to schedule_zones_url, notice: 'Schedule zone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule_zone
      @schedule_zone = ScheduleZone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_zone_params
      params.require(:schedule_zone).permit(:payload)
    end
end
