class UserController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    render json: Employee.all
  end

  def show
    render json: Employee.find_by(email: params[:email])
  end

  def create
    render json: Employee.create!(user_params)
  end

  private

  def user_params
    params.required(:user).permit(:first_name, :last_name, :email)
  end
end
