/// @description Insert description here
// You can write your code in this editor

velh = 0;
velv = 0;
vel = 4;
grav = 0.25;
velJump = 6;

hit = false;
_timerHit = room_speed * 0.5;
timerHit = 0;

timerInv = 0;
_timerInv = room_speed * 1;

inputs = {
	left: vk_left,
	right: vk_right,
	jump: vk_space
}