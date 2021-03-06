class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :stop_inactive_user, only: [:show, :edit, :update]

  # GET /users
  # GET /users.json
  def index
    @core = params[:core]

    if @core.nil?
      @users = User.all.where(active: true)
    else
      @users = User.all.where(active: true).where(nucleo: @core)
    end
  end

  #GET /pt
  def trainees
    @users = User.all.where(active: true)
  end 

  #GET /reger
  def reger
    @users = User.all.where(active: true)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @types = @user.types
  end

  # GET /users/new
  def new
    @user = User.new
  end
  
  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path}
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
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path}
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  # Usuario nunca são apagados do banco, apenas tornam-se inativos
  def destroy
    @user.update({nome: @user.nome, email: @user.email, membro: @user.membro, nucleo: @user.nucleo, active: false})
    respond_to do |format|
      format.html { redirect_to users_path}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def stop_inactive_user
      if @user.active == false then redirect_to :root, alert: "Erro! Usuário Inativo." end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:nome, :email, :membro, :nucleo)
    end
end
