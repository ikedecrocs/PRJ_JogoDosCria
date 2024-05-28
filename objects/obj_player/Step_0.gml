/// @description Insert description here
// You can write your code in this editor

// MOVIMENTO

// Resgata as teclas de movimentos selecionadas
var _key_right = keyboard_check(vk_right);
var _key_left = keyboard_check(vk_left);
var _key_jump = keyboard_check(vk_space) || keyboard_check(vk_up);

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

show_debug_message(hsp);

// Calcula o movimento vertical
vsp = vsp + grv;

// Calcula se pode pular (gera o buffer de pulo do transformice)
if (can_jump-- > 0) && _key_jump {
	vsp = vsp_jump;
	can_jump = 0;
}

// Contato com paredes
if (place_meeting(x + hsp, y, obj_parede)) {
	while (abs(hsp) > 0.1) {
		hsp *= 0.5;
		if (!place_meeting(x + hsp, y, obj_parede)) {
			x += hsp;
		}
	}
	hsp = 0;
}
x += hsp;

if (place_meeting(x, y + vsp, obj_parede)) {
	if (vsp > 0) {
		can_jump = 10;
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