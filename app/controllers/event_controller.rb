class EventController < ApplicationController
  #je viens charger tous les instances de event dans @event_array
  #puis je les affiches dans la view de event associé à la methode index
  def index
    @event_array = Event.all
  end

  #j instancie un event pour le form_tag
  def new
    @event = Event.new
  end

  # bug il faut corrigé le parametre datetime 
  def create
    puts "k"*60
    puts params
    puts "k"*60

    e = Event.new(start_date:params[start_date],duration:params[:duration],title:params[:title],description:params[:description],price:params[:price],location:params[:location],admin_event_id:current_user.id)

  if e.save
    redirect_to(root_path)
    puts "SAVE"*60
    puts "SAVE"*60
  end
end



end
