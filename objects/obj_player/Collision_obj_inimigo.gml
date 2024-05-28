/// @description Insert description here
// You can write your code in this editor
if moeda < 3 {
	instance_destroy();
	room_restart();
}
else {
	instance_destroy(other);
}