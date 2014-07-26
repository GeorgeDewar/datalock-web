# handling events from the andoid client
class ApiController < ApplicationController
  skip_before_action :authenticate_user!, :all

  def remote_unlock
    Message.create payload: "Unlock from android", command: Command.find_by(name: "Unlock")

    payload = {
      message: "Successfully unlocked",
      status: 200
    }
    return render :json => payload
  end

  def initial_login

  end


  def sms_unlock 
    return render :nothing => true
    # MjYyOS4wODUyMDQwOTgzNzM3RGF0YWNvbXAgMjAxNCAtIERvb3
  end

end
