class MessagesController < ApplicationController
  skip_before_action :authenticate_user!, :all
  def poll
    if Message.next_message.present?
      string = Message.next_message.to_package
      if string.present?
        Message.next_message.update sent: true
        render :text => string
      else
        render :nothing => true, :status => 204 
      end
    else
      render :nothing => true, :status => 204 
    end
  end

  def confirm
    begin
      text = request.raw_post
      @message = Message.find text
      @message.update confirmed_at: Time.now
      render :nothing => true, :status => 204 
    rescue
      render :nothing => true, :status => 204 
    end
  end

  def log_event
    
  end


end
