class Message < ActiveRecord::Base
  belongs_to :command

  scope :next_message, -> { where(confirmed_at: nil).order(:created_at).first }

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
  end

  private 
  def unlock
    "UNLOCKING"
  end

  def lock 
    "LOCKING"
  end

  def add_edit_user
    "ADDING USER"
  end  

  def remove_user
    "REMOVING USER"
  end
end
