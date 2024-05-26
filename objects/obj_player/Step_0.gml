/// @description Insert description here
// You can write your code in this editor

// MOVIMENTO

if keyboard_check(vk_anykey) {
	sprite_index = spr_tali_run;
	
	if keyboard_check(vk_up) {
		y -= obj_speed;
	} 

	if keyboard_check(vk_down) {
		y += obj_speed;
	}

	if keyboard_check(vk_left) {
		image_xscale = -1;
		x -= obj_speed;
	}

	if keyboard_check(vk_right) {
		image_xscale = 1;
		x += obj_speed;
	}
} else {
	sprite_index = spr_tali;
}
