class SlackChannelsController < ApplicationController
  before_action :set_slack_channel, only: [:show, :edit, :update, :destroy]

  def index
    @slack_channels = SlackChannel.all
  end

  def show
  end

  def new
    @slack_channel = SlackChannel.new
    @reports = Report.find(params[:report_id])
  end

  def edit
  end

  def create
    @slack_channel = SlackChannel.new(slack_channel_params)

    respond_to do |format|
      if @slack_channel.save
        format.html { redirect_to @slack_channel, notice: 'Slack channel was successfully created.' }
        format.json { render :show, status: :created, location: @slack_channel }
      else
        format.html { render :new }
        format.json { render json: @slack_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @slack_channel.update(slack_channel_params)
        format.html { redirect_to @slack_channel, notice: 'Slack channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @slack_channel }
      else
        format.html { render :edit }
        format.json { render json: @slack_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @slack_channel.destroy
    respond_to do |format|
      format.html { redirect_to slack_channels_url, notice: 'Slack channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_slack_channel
      @slack_channel = SlackChannel.find(params[:id])
    end

    def slack_channel_params
      params.require(:slack_channel).permit(:title, :channel, :webhook_url, :username, :report_id)
    end
end
