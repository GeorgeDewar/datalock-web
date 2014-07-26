class Event < ActiveRecord::Base

  def self.door_unlocked(user)
    Event.create(action: "Door Unlocked", user: user, user_type: user.class.name)
  end
 
  def self.door_unlocked

  end

  def self.door_locked

  end

  def self.pin_changed

  end

  def self.motion_detected

  end
end
