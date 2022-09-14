/// @description Insert description here
// You can write your code in this editor


switch (state) {
	case "idle":
			mudarSprite(spr_cannon_idle);
	break;
	
	case "on":
		mudarSprite(spr_cannon_shoot);
		
		if (image_index >= 1.5 && isShooting == false) {
			isShooting = true;
			var _ball = instance_create_layer(x + (5 * image_xscale), y - 11, "EnemiesEtc", obj_ball);
			_ball.velh = (7 + random_range(-3, 3)) * image_xscale;
			_ball.velv = -1;
		}
		
		if (image_index >= image_number - 1) {
			state = "await";
		}
	break;
	
	case "await":
		isShooting = false;
		mudarSprite(spr_cannon_idle);
		
		timerShoot--;
		
		if (timerShoot <= 0) {
			timerShoot = awaitShoot;
			state = "idle";
		}
	break;
}
