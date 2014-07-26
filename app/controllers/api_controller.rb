# handling events from the andoid client
class ApiController < ApplicationController
  skip_before_action :authenticate_user!, :all

  def remote_unlock
    Message.create payload: "Unlock from android", command: Command.find_by(name: "Unlock")
    Event.android_unlock
    payload = {
      message: "Successfully unlocked",
      status: 200
    }
    return render :json => payload
  end


  def sms_unlock 
    sms = SmsGateway.new("http://smsapi.dalek.co.nz/api/sendSMS")
    sender = params[:sender]
    message = params[:message]
    application = params[:application]
    shortcode = params[:shortcode]
    signature = params[:signature]
    # if sms.verifySignature(sender, message, application, shortcode, "MjYyOS4wODUyMDQwOTgzNzM3RGF0YWNvbXAgMjAxNCAtIERvb3", signature)
    if User.exists?(:ph_number => sender)
      Message.create payload: "Unlock from SMS", command: Command.find_by(name: "Unlock")
      Event.sms_unlock(User.find_by(ph_number: params[:sender]))
      payload = {
        message: "Successfully unlocked",
        status: 200
      }
      return render :json => payload
    else
      Event.sms_unlock(nil, sender)
      payload = {
        message: "User is unrecognised",
        status: 403
      }
      return render :json => payload
    end
  else
    payload = {
      message: "Signature verification failed",
      status: 400
    }
    return render :json => payload
  end
    # MjYyOS4wODUyMDQwOTgzNzM3RGF0YWNvbXAgMjAxNCAtIERvb3
  # end

  def users
    render json: User.all
  end

  def events
    render json: Event.all
  end

end
#def verifySignature(from, message, application, shortcode, app_secret, signature)