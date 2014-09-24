require 'rrobots'

class Honeypie
  include Robot

  def initialize
    super
    @direction = :up

  end

  def tick events
    say "HONEY POWER !!!"

    turn 1 if heading != 90


    if x < 700
      turn_gun 1 if gun_heading != 0
    else
      turn_gun 1 if gun_heading != 180
    end

    fire 1
    fire 1
    fire 1
    fire 1
    fire 1
    fire 1

    if heading == 90 && @direction == :up
        accelerate 1
        if y == 60
          @direction = :down
        end
    end

    if heading == 90 && @direction == :down
        accelerate -1
        if y == 1540
          @direction = :up
        end
    end

  end
end