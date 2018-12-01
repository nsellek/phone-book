class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_states, only: %i[ new edit index ]

  # GET /users
  # GET /users.json
  def index
    @users = if search_present?
               User.where(search_params)
             else
               User.all
             end
  end

  # GET /users/1
  # GET /users/1.json
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  # POST /users.json
  def create
    user = user_params.merge(state_id: State.find_by(name: params[:state]))
    @user = User.new(user)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    # byebug
    user = user_params.merge(state_id: State.find_by(name: params[:user][:state]).id)
    respond_to do |format|
      if @user.update!(user)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def set_states
    @states = State.options
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email).to_h
  end

  def search_params
    params.permit(:first_name, :last_name, :email, :state).select { |_, v| v.present? }
  end

  def search_present?
    params[:first_name].present? ||
      params[:last_name].present? ||
      params[:email].present? ||
      params[:state].present?
  end
end
