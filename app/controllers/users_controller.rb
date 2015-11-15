class UsersController < ApplicationController
	before_filter :user_signed_in?, only: [:show, :edit, :destroy]
	skip_before_filter :authenticate_user!, only: [:new, :create, :index, :destroy]
 
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
        @attended_events = Event.where(id:Attend.where(user_id:@user.id).pluck(:event_id))
		@events = Event.where(user_id: params[:id])
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in @user
			flash[:success] = "Welcome to the Sample App!"
			redirect_to home_path
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy

		redirect_to :root
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :phone_number, :email, :password, :password_confirmation)
	end

end
