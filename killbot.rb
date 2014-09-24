require 'rrobots'

class Killbot
  include Robot

  def tick events

    if energy <= 10
      say("I'm meeeeelllllllting!")
    else
      say('Killbot will DESTROY YOU!')
    end

    movement
    aim
  end

  def aim
    unless events['robot_scanned'].empty?
      turn_radar 1 if time == 0
      turn_gun -3
      fire 3
    else
      turn_gun 30
    end
  end

  def movement
    # if x < 50 && heading == (160..200)
    #   accelerate 1
    #   turn -10
    # elsif
    #   x > (battlefield_width - 50) && heading == ((340..360)&&(0..20))
    #   accelerate 1
    #   turn -10

    # elsif
    #     y < 50 && heading == (250..290)
    #     accelerate 1
    #     turn -10

    # elsif
    #     y > (battlefield_height - 50) && heading == (70..110)
    #     accelerate 1
    #     turn -10
    # else
    accelerate rand(-8..8)
    turn 2
    # end
  end
end
