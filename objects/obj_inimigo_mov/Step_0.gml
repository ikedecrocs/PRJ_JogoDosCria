/// @description Insert description here
// You can write your code in this editor
x += hsp;
y += vsp;

if ((x - (sprite_width / 2)) < 0) || (x + (sprite_width / 2) > room_width) {
	hsp = -hsp;
}

if ((y - (sprite_height / 2)) < 0) || (y + (sprite_height / 2) > room_height) {
	vsp = -vsp;
}