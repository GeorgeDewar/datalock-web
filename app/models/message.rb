class Message < ActiveRecord::Base
  belongs_to :command

  def self.next_message
    Message.where(confirmed_at: nil).order(:created_at).first
  end

  def to_package user=nil
    msg = ""
    if command.code == "UNL"
      msg = unlock
    elsif command.code == "LOK"
      msg = lock
    elsif command.code == "USR"
      msg = add_edit_user(user)
    elsif command.code == "REM"
      msg = remove_user(user)
    end
    msg.gsub(/\s+/, "") # clean up any white space added by indentation
  end

  def confirm!
    self.confirmed_at = Time.now
    self.save
  end

  private 
  def unlock
    "
    #{(id%100).to_s.rjust(2, '0')}
    #{Command.find_by(name: "Unlock").code}
    "
  end

  def lock 
    "
    #{(id%100).to_s.rjust(2, '0')}
    #{Command.find_by(name: "Lock").code}
    "
  end

  def add_edit_user
    "
    #{(id%100).to_s.rjust(2, '0')}
    #{Command.find_by(name: "Add/Edit User").code}
    #{(user.id%100).to_s.rjust(2, '0')}#{truncate(user.name)}##{user.pin}
    "
  end  

  def remove_user
    "
    #{(id%100).to_s.rjust(2, '0')}
    #{(user.id%100).to_s.rjust(2, '0')}
    #{Command.find_by(name: "Remove User").code}
    "
  end
end
