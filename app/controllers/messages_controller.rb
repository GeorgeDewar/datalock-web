class MessagesController < ApplicationController
  skip_before_action :authenticate_user!, :all
  def poll
    string = Message.next_message.to_package
    render :text => string
  end

  def confirm
    @message = Message.find params[:id]
  end

  def remote_unlock
    
  end

end
