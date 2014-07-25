class Message < ActiveRecord::Base
  belongs_to :command

  def unlock

  end

  def lock 

  end

  def add_edit_user

  end  

  def remove_user

  end
  
end
