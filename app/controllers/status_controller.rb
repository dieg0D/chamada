class StatusController < ApplicationController

	def index
		
	end
	
	def new
		@att = AttendanceList.all.last
		@user = User.all
		@status = []
		@user.each do |u|
			@status << Status.new(user_id: u.id, attendance_list_id: @att.id, state: "Presente")
		end
	end

	def create
		@a = params[:status]
		@a.each do |a|
			puts "AAAAAAAAAAAAAAAA"
			
			@att = AttendanceList.all.last
			id = a["user_id"].to_i
			st = a["state"].to_s
			puts id.class
			puts st.class
			@ss = Status.create(user_id: id, attendance_list_id: @att.id, state: st)
		end
		redirect_to root_path
  end

  	def edit
  		@att = AttendanceList.find(params[:id])
  		@user = User.all
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
