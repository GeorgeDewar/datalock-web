class Event < ActiveRecord::Base
  belongs_to :user


  def self.door_unlocked(user)
    if user.class.name == "User"
      Event.create(action: "Door Unlocked", user: user)
    else
      Event.create(action: "Door Unlocked", temp_user: temp_user)
    end
  end

  def self.pin_changed(user)
    if user.class.name == "User"
      Event.create(action: "Door Unlocked", user: user)
    else
      Event.create(action: "Door Unlocked", temp_user: temp_user)
    end
  end

  def self.motion_detected(user)
    if user.class.name == "User"
      Event.create(action: "Door Unlocked", user: user)
    else
      Event.create(action: "Door Unlocked", temp_user: temp_user)
    end
  end
end
