/// @description Insert description here
// You can write your code in this editor

var _col = instance_place(x + velh, y, obj_ground);

if (_col) {
	if (velh > 0)
		x = _col.bbox_left + (x - bbox_right);
	if (velh < 0)
		x = _col.bbox_right + (x - bbox_left);
	
	velh = 0;
}

x += velh;

var _col = instance_place(x, y + velv, obj_ground)
if (_col) {
	if (velv > 0) 
		y = _col.bbox_top + (y - bbox_bottom);
	if (velv < 0)
		y = _col.bbox_bottom + (y - bbox_top);
	
	velv = 0;
}

y += velv;