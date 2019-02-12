class UserMailer < ApplicationMailer
    default from: 'no-reply@EventProject.fr'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://event-project.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def alert_to_admin_send(event_id)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    event = Event.find(event_id)
    admin_id = event.admin_event_id
    @admin_event = User.find(admin_id)


    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://event-project.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @admin_event.email, subject: 'Une personne s est inscrite sur ton event !') 
  end
end
