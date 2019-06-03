/// @param attacker,defender
show_debug_message("Combat happening")
var attacker = argument0,
defender = argument1,
hit_base = irandom(11),
base_dmg = irandom_range(attacker.s_dmg_min,attacker.s_dmg_max),
hit_mod = attacker.s_speed - defender.s_agility,
dmg_mod = attacker.s_strength - defender.s_endurance,
wounded = defender,
hit = hit_base + hit_mod,
dmg = 0,

//Check for Hit
if(hit > 3) {
	dmg = base_dmg + dmg_mod;
	wounded = defender;
}
else if(hit < -3) {
	dmg = base_dmg - dmg_mod;
	wounded = attacker;
}

if(global.socket_other != noone) {
	var buff = buffer_create(100,buffer_fixed,1);
	buffer_write(buff,buffer_u8,wounded.object_index);
	buffer_write(buff,buffer_u16,wounded.x);
	buffer_write(buff,buffer_u16,wounded.y);
	buffer_write(buff,buffer_u8,damage_taken);
	buffer_write(buff,buffer_u8,hit);
	buffer_write(buff,buffer_u8,dmg);
	network_send_packet(global.socket_other,buff,buffer_tell(buff));
	buffer_delete(buff);
}

damage_taken(wounded,hit,dmg);