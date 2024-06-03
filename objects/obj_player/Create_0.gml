/// @description Insert description here
// You can write your code in this editor
moeda = 0;

// gravidade
grv = 0.3;
grv_normal = 0.3;
grv_parede = 0.07;

// velocidade atual 
hsp = 0;
vsp = 0;

// velocidade andando
hsp_walk = 3.5;

// velocidade do pulo
vsp_jump_normal = -8;
vsp_jump_parede = -6;
vsp_jump = vsp_jump_normal;

// pode pular
time_jump_normal = 10;
time_jump_parede = 15;
can_jump = time_jump_normal;

// esta olhando para a parede
looking_wall = false;