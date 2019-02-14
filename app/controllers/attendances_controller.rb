class AttendancesController < ApplicationController

  def index
    puts "Xindex_controller_attendances"*20
    @attendance = Attendance.where(event_id:params[:event_id])
    @event = Event.where(id:params[:event_id])
    @admin = User.where(id:params[:admin_event_id])
    puts "E"*100
  end


  def new
    @attendance = Attendance.new
    @event = Event.find(params[:event_id])
  end

  def edit
    @attendance = Attendance.find(params[:id])
  end

  def create
    puts event_id:params[:event_id]
    puts "attendance def create"*20
    @attendance = Attendance.new(stripe_customer_id:params[:stripe_customer_id],participant_id:current_user.id,event_id:Event.last.id)
    @event = Event.where(id:params[:event_id])

    if @payment_validated=true
        puts "if true"*20

      @attendance.save
      redirect_to(root_path)

    else
      render :new
    end
  end

  def update
    @attendance = Attendance.find(params[:id])
    if @attendance.update(stripe_customer_id:params[:stripe_customer_id],participant_id:current_user.id,event_id:params[:event_id])
      redirect_to(event_path)
    else
      render :edit
    end
  end

  rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to event_path
end
