require 'rrobots'

class Destroya
  include Robot

  def tick events
    turn_radar 1 if time == 0
    turn_gun 30 if time < 3
    accelerate 1
    time % 250 < 125 ? turn(2) : turn(-2)
    fire 3 unless events['robot_scanned'].empty?
  end
end
