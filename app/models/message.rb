class Message < ActiveRecord::Base
  belongs_to :command

  belongs_to :user

  def self.next_message
    Message.where(sent: false).order(:created_at).first
  end

  def to_package
    msg = ""
    if command.code == "UNL"
      msg = unlock
    elsif command.code == "LOK"
      msg = lock
    elsif command.code == "USR"
      msg = add_edit_user
    elsif command.code == "REM"
      msg = remove_user
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
    UNL
    "
  end

  def lock 
    "
    #{(id%100).to_s.rjust(2, '0')}
    LOK
    "
  end

  def add_edit_user
    "
    #{(id%100).to_s.rjust(2, '0')}
    USR
    #{(user.id%100).to_s.rjust(2, '0')}#{user.pin}#{user.name}#
    "
  end  

  def remove_user
    "
    #{(id%100).to_s.rjust(2, '0')}
    #{(user.id%100).to_s.rjust(2, '0')}
    REM
    "
  end
end
