require 'rrobots'

class Spinduck
  include Robot

  def initialize
    @ranges = []
    super
  end

  def tick events
    turn 10
    accelerate(4)
    # if we find in radar, store radar heading
    if events['robot_scanned']
      @ranges << radar_heading
    end

    # AFTER many times, compute the average middle point
    if @ranges.size == 10
      # compute middle point/angle

      # shift one

      # fire!!
    end

    8

    fire 1 unless events['robot_scanned'].empty?
  end
end
