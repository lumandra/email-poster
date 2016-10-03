class ReportsController < ApplicationController
  # before_action :check_admin
  before_action :set_report, only: [:show, :edit, :update, :destroy]


  def index
    @reports = current_user.reports
  end


  def show
    @emails = Email.where(report_id: @report.id)
    @slack_channels = SlackChannel.where(report_id: @report.id)
    @report_id = @report.id
  end


  def new
    @report = Report.new
  end


  def edit
  end


  def create
    @report = current_user.reports.build(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, flash: { success: 'Report was successfully created.' } }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, flash: { success: 'Report was successfully updated.' } }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, flash: { success: 'Report was successfully destroyed.' } }
      format.json { head :no_content }
    end
  end

  private

    def set_report
      @report = Report.find(params[:id])
      authorize! :manage, @report
    end

    def report_params
      params.require(:report).permit(:title, :email_to_prefix)
    end

    def check_admin
      redirect_to root_path unless current_user.is_admin
    end
end
