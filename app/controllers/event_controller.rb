class EventController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  #je viens charger tous les instances de event dans @event_array
  #puis je les affiches dans la view de event associé à la methode index
  def index
    @event_array = Event.all
  end

  def show
    puts "$" * 60
    puts params[:id]
    puts "$" * 60
    @event = Event.find(params[:id])
    puts "$" * 60
    @admin = User.all
    @participant = User.all
    @attendances = Attendance.all

  end

  #instancie un event pour le form_tag
  def new
    @event = Event.new

  end

  # bug il faut corrigé le parametre datetime
  def create
    puts "*"*60
    puts params[:start_date]


    puts params

    puts "k"*60
    puts admin_event_id:current_user.id


    date = params[:start_date]
    e = Event.new(start_date:DateTime.new(date[:year].to_i,date[:month].to_i,date[:day].to_i,date[:hour].to_i,date[:minute].to_i,0),duration:params[:duration],title:params[:title],description:params[:description],price:params[:price],location:params[:location])
    puts "k"*60
    puts e.admin_event_id
    puts "k"*60
    e.instance_variable_set(:@admin_event_id, current_user.id)
    puts "k"*60
    puts e.admin_event_id
    puts "k"*60

  if e.save
    redirect_to(root_path)
    puts "SAVE"*60
    puts "SAVE"*60
  end
end



end
