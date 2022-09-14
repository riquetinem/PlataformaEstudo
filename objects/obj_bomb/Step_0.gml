/// @description Insert description here
// You can write your code in this editor


velv += grav;

if (state == "off") {
	sprite_index = spr_bomb;
} else if (state == "on") {
	sprite_index = spr_bomb_on;
	
	if (timerBoom > 0) {
		timerBoom--;
	} else {
		state = "boom";
	}
} else {
	if (sprite_index != spr_bomb_boom) {
		sprite_index = spr_bomb_boom;
		image_index = 0;
	}
	
	if (image_index >= image_number - 1)
		instance_destroy();
		
	var _player = instance_place(x, y, obj_player);
	
	if (_player) {
		with(_player){
			timerHit = _timerHit;
			timerInv = _timerInv;
			hit = true;
		}
	}
	
	var _bomb = instance_place(x, y, obj_bomb);
	
	if (_bomb) {
		if (_bomb.state == "off") {
			_bomb.timerBoom = room_speed;
			_bomb.state = "on";
		}
	}
}
