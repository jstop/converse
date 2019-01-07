class TimeLogsController < ApplicationController
  before_action :set_time_log, only: [:show, :edit, :update, :destroy]

  def index
    if params[:start] and params[:end]
      @time_logs = TimeLog.where(datetime: params[:start]..params[:end])
    else
      @time_logs = TimeLog.all
    end
  end

  def show
  end

  def new
    @time_log = TimeLog.new
  end

  def edit
  end

  def create
    puts time_log_params
    @time_log = TimeLog.new(time_log_params)
    @time_log.user = current_user if signed_in?
    @time_log.save
    puts @time_log.errors.full_messages
  end

  def update
    @time_log.update(time_log_params)
  end

  def destroy
    @time_log.destroy
  end

  private
    def set_time_log
      @time_log = TimeLog.find(params[:id])
    end

    def time_log_params
      params.require(:time_log).permit( :log, :datetime, :duration)
    end
end
