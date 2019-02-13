class UsersController < ApplicationController
  def show



    puts "$" * 60
    puts params[:id]
    puts "$" * 60

    

    @user = User.find_by(id:params[:id])



  end

end
