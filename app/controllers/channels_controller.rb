class ChannelsController < ApplicationController
  def index
    channels = Channel.all
    render json: channels_serializer(channels)
  end

  def show
    channel = Channel.find(params[:id])
    render json: channel_serializer(channel)
  end

  def create
    channel = Channel.new(channel_params)
    if channel.save
      render json: channel_serializer(channel)
    else
      render json: {error: channel.errors.full_messages}
    end
  end

  def update
  end
  def destroy
  end
  def channel_serializer(channel)
    {name: channel.name, description: channel.description}
  end

  def channels_serializer(channels)
    channels.map do |channel|
      channel_serializer(channel)
    end
  end

  private

  def channel_params
    params.require(:channel).permit(:name, :description, :user_id)
  end
end