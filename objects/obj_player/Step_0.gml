/// @description Insert description here
// You can write your code in this editor

// MOVIMENTO

// Resgata as teclas de movimentos selecionadas
var _key_right = keyboard_check(vk_right);
var _key_left = keyboard_check(vk_left);
var _key_jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_up);

// Muda sprite de estiver pressionando um movimento
if abs(hsp) > 0 {
	sprite_index = spr_tali_run;
	if hsp < 0 {
		image_xscale = -1;
	} else {
		image_xscale = 1;
	}
} else {
	sprite_index = spr_tali;
}

// Calcula o movimento horizontal
hsp = (_key_right - _key_left) * hsp_walk;

// Calcula o movimento vertical
vsp = vsp + grv;

// Calcula se pode pular (gera o buffer de pulo do transformice)
if (can_jump-- > 0) && _key_jump {
	vsp = vsp_jump;
	can_jump = 0;
}

// Contato com a parede -- X
if place_meeting(x + hsp, y, obj_parede) {
	while (abs(hsp) > 0.1) {
		hsp *= 0.5;
		if (!place_meeting(x + hsp, y, obj_parede)) {
			x += hsp;
		}
	}
	hsp = 0;
}
x += hsp;

// Contato com a parede -- Y
if place_meeting(x, y + vsp, obj_parede) {
	if (vsp > 0) {
		vsp_jump = vsp_jump_normal;
		can_jump = time_jump_normal;
	}
	while (abs(vsp) > 0.1) {
		vsp *= 0.5;
		if (!place_meeting(x, y + vsp, obj_parede)) {
			y += vsp;
		}
		vsp = 0;
	}
}
y += vsp;

// Deslizar na parede
if (place_meeting(x + hsp_walk, y, obj_parede) || place_meeting(x - hsp_walk, y, obj_parede)) && vsp != 0 {
	if (vsp > 0) {
		grv = grv_parede;
	}
	looking_wall = true;
} else {
	grv = grv_normal;
}

// Habilita o walljump do transformice
if !place_meeting(x + hsp, y, obj_parede) && looking_wall == true && (_key_right == true || _key_right == true) {
	vsp_jump = vsp_jump_parede;
	can_jump = time_jump_parede;
	looking_wall = false;
}