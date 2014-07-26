# handling events from the andoid client
class ApiController < ApplicationController
  skip_before_action :authenticate_user!, :all

  def remote_unlock
    # error: "No such user; check the submitted email address",
    Message.create payload: "Unlock from android", command: Command.find_by(name: "Unlock")
    # status: 400
    payload = {
      message: "Successfully unlocked",
      status: 200
    }
    render :json => payload, :status => :success
  end

  def initial_login

  end

end
