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

	def update
	  if @user.update(user_params)
	    render json: @user
	  else
	    render json: @user.errors, status: :unprocessable_entity
	  end
	end
	

	def destroy
    @user.destroy
  end



	def user_serializer(user)
		{name:user.name, email:user.email}
	end




	private

	def set_user
    @user = User.find(params[:id])
  end

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

end