class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :temp_user


  def self.door_unlocked(user)
    if user.class.name == "User"
      Event.create(action: "Door Unlocked via website", user: user)
    else
      Event.create(action: "Door Unlocked via website", temp_user: temp_user)
    end
  end  

  def self.sms_unlock(user=nil, ph_number=nil)
    if user.present?
      Event.create action: "SMS Unlock", user: User.find_by(ph_number: ph_number)
    else
      Event.create action: "Failed SMS Unlock by #{ph_number}"
    end
  end

  def self.android_unlock
    Event.create action: "Android Unlock", user: User.first
  end

  def self.pin_changed(user=nil, temp_user=nil)
    if user.class.name == "User"
      Event.create(action: "Pin Changed", user: user)
    else
      Event.create(action: "Pin Changed", temp_user: temp_user)
    end
  end

  def self.motion_detected(user)
    if user.class.name == "User"
      Event.create(action: "Motion Detected", user: user)
    else
      Event.create(action: "Motion Detected", temp_user: temp_user)
    end
  end
end
