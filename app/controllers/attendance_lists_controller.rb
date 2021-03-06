class AttendanceListsController < ApplicationController
  before_action :set_attendance_list, only: [:show, :edit, :update, :destroy]
  before_action :select_type, only: [:new, :edit, :update, :create]

  skip_before_action :verify_authenticity_token

  # GET /attendance_lists
  # GET /attendance_lists.json
  def index
  end

  def datatable
    render json: AttendanceListDatatable.new(params)
  end

  # GET /attendance_lists/1
  # GET /attendance_lists/1.json
  def show
  end

  # GET /attendance_lists/new
  def new
    @attendance_list = AttendanceList.new
    
    @users = User.all.where(active: true).order(nome: :asc)
  end

  # GET /attendance_lists/1/edit
  def edit
  end

  # POST /attendance_lists
  # POST /attendance_lists.json
  def create
    @attendance_list = AttendanceList.new(attendance_list_params)
      if @attendance_list.save 
      redirect_to new_status_path
     else 
      render :new
    end

  end


  # PATCH/PUT /attendance_lists/1
  # PATCH/PUT /attendance_lists/1.json
  def update
  
      if @attendance_list.update(attendance_list_params)
        redirect_to edit_status_path(@attendance_list)
       
      else
        render :edit 
      end
   
  end

  # DELETE /attendance_lists/1
  # DELETE /attendance_lists/1.json
  def destroy
    @attendance_list.destroy
    respond_to do |format|
      format.html { redirect_to attendance_lists_url, notice: 'Attendance list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def select_type
      @select_type = Type.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_attendance_list
      @attendance_list = AttendanceList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_list_params
      params.require(:attendance_list).permit(:data, :description, :type_id)
    end
end
