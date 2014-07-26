class MessagesController < ApplicationController
  skip_before_action :authenticate_user!, :all
  def poll
    if Message.next_message.present?
      string = Message.next_message.to_package
      if string.present?
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
    @message.confirmed_at Time.now
    @message.save
    render :nothing => true, :status => 204 

  rescue
    render :nothing => true, :status => 204 
  end
end


end
