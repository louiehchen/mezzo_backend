class InputsController < ApplicationController
  def index
    @inputs = Input.all
    render json: @inputs, each_serializer: InputSerializer
  end

  def new
    @input = Input.new
  end
  
  def create
    @input = Input.new(input_params)

    if @input.save
      render json: @input, status: :created, location: @input
    else
      render json: @input.errors, status: :unprocessable_entity
    end

  end 

  private

  def input_params
    params.require(:input).permit(:name, :artist, :audio)
  end
end