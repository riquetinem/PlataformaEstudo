/// @description Insert description here
// You can write your code in this editor

state = "idle";
awaitShoot = room_speed * 5;
timerShoot = awaitShoot;
isShooting = false;

mudarSprite = function(_sprite) {
	if (sprite_index != _sprite) {
			sprite_index = _sprite;
			image_index = 0;
	}
}
