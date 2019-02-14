class AttendancesController < ApplicationController

  class AttendancesController < ApplicationController

  def index
    @participants = Attendance.where(event_id: params[:event_id])
    puts @participants
    @event = Event.find(params[:event_id])
  end

  def new
    @attendance = Attendance.new
  end

  def edit
    @attendance = Attendance.find(params[:id])
  end

  def create
    @attendance = Attendance.new(stripe_customer_id:params[:stripe_customer_id],participant_id:current_user.id,event_id:params[:event_id])
    if @attendance.save
      @payment_validated=true
      redirect_to event_path

    else
      render :new
    end
  end

  def update
    @attendance = Attendance.find(params[:id])
    if @attendance.update(model_params)
      redirect_to(event_path)
    else
      render :edit
    end
  end

  rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to event_path
end

end
