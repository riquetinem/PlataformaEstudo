/// @description Insert description here
// You can write your code in this editor

velv += grav;

if (place_meeting(x, y + 1, obj_ground)) {
	if (velh != 0) {
		velh *= 0.9;
	}
} else {
	velh *= 0.98;
}

if (abs(velh) <= 0.1) {
	instance_create_layer(x, y + sprite_height/2, layer, obj_bomb);
	instance_destroy();
}

var _player = instance_place(x, y, obj_player);
var _bomb = instance_place(x, y, obj_bomb);
	
if (_player) {
	with(_player){
		timerHit = _timerHit;
		timerInv = _timerInv;
		hit = true;
	}
}


if (_bomb) {
	if (_bomb.state == "off") {
		_bomb.state = "on";
	}
}