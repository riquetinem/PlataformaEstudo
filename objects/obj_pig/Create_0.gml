/// @description Insert description here
// You can write your code in this editor
event_inherited();

vel = choose(1, -1);
walking = choose(true, false);
timeToWalk = room_speed * 3;

if (walking) 
	velh = choose(vel, -vel);
else
	velh = 0;