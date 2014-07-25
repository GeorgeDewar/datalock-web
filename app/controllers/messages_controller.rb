class MessagesController < ApplicationController

  def poll
    string = Message.next_message.to_package
    render :text => string
  end

  def arduino_response

  end

end
