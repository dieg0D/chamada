class StatusController < ApplicationController

	def index
		
	end
	
	def new
		@att = AttendanceList.all.last
		@user = @att.type.users.where(active: true)
		@status = []
		@user.each do |u|
			@status << Status.new(user_id: u.id, attendance_list_id: @att.id, state: "Presente")
		end
	end

	def create
		@att = AttendanceList.all.last
		@missing = []
		
		params[:status].each do |a|
			
			id = a["user_id"].to_i
			st = a["state"].to_s
			@ss = Status.create(user_id: id, attendance_list_id: @att.id, state: st)

			if st == "Falta" then @missing << User.find(id) end 
		end

		AttendanceListMailer.with(data: @att.data, 
									type: @att.type.name, 
									missing: @missing,
									admin: current_admin.email).missing_email.deliver_now

		redirect_to root_path
  end

  	def edit
  		@att = AttendanceList.find(params[:id])
  		@user = User.all.order(:nome)
  		@status = @att.status
  		puts @status
  	end

  	def update
  		puts "UPPPPPPPPPPPPPPPPPPPPPPP"
  		@att = AttendanceList.all.last
  		@a = params[:status]
  		
		@a.each do |a|
			ii = a[1]["user_id"]
			is = a[1]["state"]
			@att.status.where(user_id: ii).update(state: is)
		end
		redirect_to root_path
  	end

	def status_params(pp)
    	#pp.params.permit(:state, :user_id, :attendance_list_id)
    	puts pp
  	end
end
