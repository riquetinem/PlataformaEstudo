/// @description Insert description here
// You can write your code in this editor

if (dead) {
	sprite_index = spr_pig_dead;
	
	if (image_speed <= 0)
		image_alpha -= 0.01;
		
	if (image_alpha <= 0) 
		instance_destroy();
	
	exit;
}

var _ground = place_meeting(x, y + 1, obj_ground);

if (state == "normal") {
	var _bomb = instance_place(x, y, obj_bomb);
	var _cannon = instance_place(x, y, obj_cannon);

	if (_bomb) { // TODO: remove two if and add || 
		if (_bomb.state == "off") {
			state = "lightingOn";
		}
	}
	
	if (_cannon) {
		if (_cannon.state == "idle") {
			state = "lightingOn";
		}
	}
	
	if (_ground) {
		timeToWalk -= 1;
	
		if (timeToWalk <= 0) {
			walking = choose(true, false);
		
			if (walking) 
				velh = choose(vel, -vel);
			else
				velh = 0;
		
			timeToWalk = room_speed * 3;
		}
	
		if (velh != 0 && !hit) {
			sprite_index = spr_pig_run;
			image_xscale = sign(velh);
		} else
			sprite_index = spr_pig_idle;
		
		if (place_meeting(x + velh, y, obj_ground))
			velh *= -1;
		
		if (!canFall && !place_meeting(x + (velh * 10), y + 1, obj_ground))
			velh *= -1;
	} else {	
		velv += grav;
	
		if (velh != 0) 
			image_xscale = sign(velh);
	}
} else if (state == "lightingOn") {
	if (sprite_index != spr_pig_lighting) {
		sprite_index = spr_pig_lighting;
		image_index = 0;
	}
	velh = 0;
	
	if (image_index >= image_number - 1)
		state = "lightingBomb";
} else if (state == "lightingBomb") {
	if (sprite_index != spr_pig_bomb) {
		sprite_index = spr_pig_bomb;
		image_index = 0;
	}
	
	if (image_index >= image_number - 1) {
		var _bomb = instance_place(x, y, obj_bomb);
		var _cannon = instance_place(x, y, obj_cannon);
		
		if (_bomb)
			_bomb.state = "on";
		
		if (_cannon)
			_cannon.state = "on";
			
		state = "normal";
	}
}

if (hit && !dead) {
		sprite_index = spr_pig_hit;
		velh = 0;
}
	