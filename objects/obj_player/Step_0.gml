/// @description Insert description here
// You can write your code in this editor

var isJumping = !place_meeting(x, y + 3, obj_ground);

var _left, _right, _jump;
_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.right);
_jump = keyboard_check_pressed(inputs.jump);

if (timerHit <= 0)
	velh = (_right - _left) * vel;

// TODO: Remover os image_xscale de entro do if 
if (isJumping) {
	if (velv < 0) 
		sprite_index = spr_player_jump;
	else
		sprite_index = spr_player_fall;
		
	var _enemy = instance_place(x, y + 1, obj_enemy);
		
	if (_enemy && !_enemy.dead) {
		hit = false;
		velv = - velJump;
			
		_enemy.hit = true;
	}
	
	velv += grav;
	
	if (velh != 0)
		image_xscale = sign(velh);
}
else {
	if (velh != 0) {
		sprite_index = spr_player_run;
		image_xscale = sign(velh);
	} else {
		sprite_index = spr_player_idle;
	}
	
	if (_jump) velv = - velJump;
}

if (hit)
	sprite_index = spr_player_hit;

if (timerHit > 0) 
	timerHit--;
else 
	hit = false;

if (timerInv > 0) {
	timerInv--;
	image_alpha = 0.5;
} else {
	image_alpha = 1;
}

var _enemy = instance_place(x, y, obj_enemy);

if (_enemy && !_enemy.dead && !_enemy.hit && timerInv <= 0 && timerHit <= 0) {
	timerHit = _timerHit;
	timerInv = _timerInv;
	hit = true;
}