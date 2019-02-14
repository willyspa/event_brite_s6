class EventController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  #je viens charger tous les instances de event dans @event_array
  #puis je les affiches dans la view de event associé à la methode index
  def index
    @event = Event.all
  end

  def show
    puts "Show event params" * 20
    puts params[:id]
    puts "@event = Event.find..." * 20
    @event = Event.find(params[:id])
    puts "@admin" * 30
    @admin = User.all
  
    # puts "$" * 60
    # puts params[:id]
    # puts "$" * 60
    # @event = Event.find(params[:id])
    # puts "$" * 60
    # @admin = User.all
    # @participant = User.all
    # @attendances = Attendance.all

  end

  #instancie un event pour le form_tag
  def new
    @event = Event.new

  end

  def create
    user = current_user
    #ne fonctionne pas..
    date = params[:start_date]
    @event = Event.new(start_date:DateTime.new(date[:year].to_i,date[:month].to_i,date[:day].to_i,date[:hour].to_i,date[:minute].to_i,0), duration:params[:duration], title:params[:title], description:params[:description], price:params[:price], location:params[:location], admin_event_id:user.id)
    
    #@event = Event.new(start_date:Faker::Date.forward(5), duration:params[:duration], title:params[:title], description:params[:description], price:params[:price], location:params[:location], admin_event_id:user.id)
    if @event.save
      redirect_to(root_path)
    else
      render :new
    end
  end

  before_action :authenticate_admin_event, only: [:update, :destroy]

  def update
    @event = Event.find(params[:id])
    if @event.update(start_date:params[:start_date],duration:params[:duration],title:params[:title],description:params[:description],price:params[:price],location:params[:location],admin_event_id:current_user.id)
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to(root_path)
  end

  private

  def authenticate_admin_event
   if params[:user_id] == params[:admin_event_id]
     flash[:danger] = "You aren't admin of this event."
     redirect_to @event
   end
  end

end
