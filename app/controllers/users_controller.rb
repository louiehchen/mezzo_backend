class UsersController < ApplicationController
	

	def show
		@user = User.find(params[:id])
		render json: user_serializer(@user)
	end

	def create 
		@user = User.new(user_params)
		if @user.save
			render json: user_serializer(@user)
		else
			render json: {error: @user.errors.full_messages}
		end
	end

	def user_serializer(user)
		{name:user.name, email:user.email}
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

end