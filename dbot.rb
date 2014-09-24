require 'rrobots'

class Dbot
  include Robot

  def tick events
    turn_radar 1
    turn_gun 25 unless events['robot_scanned'].any?
    accelerate 6
    turn 2
    fire 2 unless events['robot_scanned'].empty?
  end
end
