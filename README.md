#Basic Repo for RoboTank Showdown!
1. Fork this repo, so you can submit your tank via PR.
1. Clone your fork.
1. Then install the project dependencies:
  - The Gosu library requires some system prep:
    - RVM users: Beware!
    - OSX users: https://github.com/jlnr/gosu/wiki/Getting-Started-on-OS-X
    - Linux users: https://github.com/jlnr/gosu/wiki/Getting-Started-on-Linux
  - Now you can install the gems
    - `$ gem install gosu`
    - `$ bundle install`

1. Run the sample robots:
  - `$ bundle exec rrobots Killa Duck`


## Useful resources

http://rubydoc.info/gems/rrobots/0.0.1/frames

https://github.com/ralreegorganon/rrobots

http://rubyforge.org/forum/?group_id=1109

## RoboTank Battle API methods

    #State
    battlefield_height  #the height of the battlefield
    battlefield_width   #the width of the battlefield
    time                #ticks since match start
    speed               #your speed (-8/8)

    x                   #your x coordinate, 0...battlefield_width
    y                   #your y coordinate, 0...battlefield_height
    energy              #your remaining energy (if this drops below 0 you are dead)
    dead                #true if you are dead
    size                #your robot's radius, if x <= size you hit the left wall
    heading             #your robot's heading, 0 pointing east, 90 pointing north,
                        #180 pointing west, 270 pointing south

    gun_heading         #the heading of your gun, 0 pointing east, 90 pointing
                        #north, 180 pointing west, 270 pointing south
    gun_heat            #your gun heat, if this is above 0 you can't shoot
    radar_heading       #the heading of your radar, 0 pointing east,
                        #90 pointing north, 180 pointing west, 270 pointing south

    #Behavior
    accelerate(param)   #accelerate (max speed is 8, max accelerate is 1/-1,
                        #negative speed means moving backwards)
    stop                #accelerates negative if moving forward (and vice versa),
                        #may take 8 ticks to stop (and you have to call it every tick)
    fire(power)         #fires a bullet in the direction of your gun,
                        #power is 0.1 - 3, this power will heat your gun
    turn(degrees)       #turns the robot (and the gun and the radar),
                        #max 10 degrees per tick
    turn_gun(degrees)   #turns the gun (and the radar), max 30 degrees per tick
    turn_radar(degrees) #turns the radar, max 60 degrees per tick
    say(msg)            #shows msg above the robot on screen
    broadcast(msg)      #broadcasts msg to all bots (they receive 'broadcasts'
                        #events with the msg and rough direction)
