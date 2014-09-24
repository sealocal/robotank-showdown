require 'rrobots'

class Bamf
  include Robot

  @@detected_values = []
  @@radar_range = (-30..30).to_a
  @@absolute_firing_range = 10
  @@spray_range = (-(@@absolute_firing_range)..@@absolute_firing_range).to_a

  def tick(events)
    store_enemy_location_probability(events)
    dodge
    if @combat_mode ||= events['robot_scanned'].any?
      cache_gun_heading
      radar_sweep
      fire_at_area
    else
      search_mode
    end
  end

  def search_mode
    fire 0.1
    turn_gun 30
  end

  def radar_sweep
    difference = radar_heading - @enemy_location
    turn_radar(@@radar_range.sample - difference)
  end

  def cache_gun_heading
    @enemy_location ||= gun_heading
  end

  def fire_at_area
    if @@detected_values.size > 5
      avg = @@detected_values.reduce(:+) / @@detected_values.size
      @enemy_location = avg
    end
    difference = gun_heading - @enemy_location
    turn_gun(@@spray_range.sample - difference)
    fire 0.1
  end

  def store_enemy_location_probability(events)
    @@detected_values.push(radar_heading) if events['robot_scanned'].any?
    @@detected_values.shift if @@detected_values.size > 20
  end

  def dodge
    accelerate 1
    turn 5
    turn_gun -5
  end
end
