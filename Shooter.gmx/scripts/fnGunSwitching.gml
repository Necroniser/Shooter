//Used for testing

//Pistol
if (keyboard_check_pressed(ord('1'))) && !(current_weapon = 1) && (can_fire)
{
    ammoreloading = 0;
    alarm[2] = -1;
    current_weapon = 1;
    can_fire = false;
    var len;
    len = audio_sound_length(Snd_PistolSwitch);
    audio_play_sound(Snd_PistolSwitch, 1, false);
    switchtime = room_speed * len;
    reloadtime = room_speed * len;
    alarm[1] = switchtime;
    weapon.alarm[0] = 1;
    weapon = instance_create(x, y, obj_wpn_pistol)
    current_ammo = Pistol_ammoloaded;
    //Stop Other Sounds
audio_stop_sound(Snd_PistolRacking)
audio_stop_sound(Snd_RifleRacking)
audio_stop_sound(Snd_SmgRacking)
audio_stop_sound(Snd_ShotgunCock)
audio_stop_sound(Snd_ShotgunShellReload)
weapon.alarm[1] = -1;
    
}

//SMG
if (keyboard_check_pressed(ord('2'))) && !(current_weapon = 2) && (can_fire)
{
    ammoreloading = 0;
    alarm[2] = -1;
    current_weapon = 2;
    can_fire = false;
    var len;
    len = audio_sound_length(Snd_RifleSwitch);
    audio_play_sound(Snd_RifleSwitch, 1, false);   
    switchtime = room_speed * len;
    reloadtime = room_speed * len;
    alarm[1] = switchtime;
    weapon.alarm[0] = 1;
    weapon = instance_create(x, y, obj_wpn_smg)
    current_ammo = SMG_ammoloaded;
    //Stop Other Sounds
audio_stop_sound(Snd_PistolRacking)
audio_stop_sound(Snd_RifleRacking)
audio_stop_sound(Snd_SmgRacking)
audio_stop_sound(Snd_ShotgunCock)
audio_stop_sound(Snd_ShotgunShellReload)
weapon.alarm[1] = -1;
}

//Rifle
if (keyboard_check_pressed(ord('3'))) && !(current_weapon = 3) && (can_fire)
{
    ammoreloading = 0;
    alarm[2] = -1;
    current_weapon = 3;
    can_fire = false;
    var len;
    len = audio_sound_length(Snd_RifleSwitch);
    audio_play_sound(Snd_RifleSwitch, 1, false);
    switchtime = room_speed * len;
    alarm[1] = switchtime;
    len = audio_sound_length(Snd_RifleRacking);
    reloadtime = room_speed * len;
    weapon.alarm[0] = 1;
    weapon = instance_create(x, y, obj_wpn_rifle)
    current_ammo = Rifle_ammoloaded;
    //Stop Other Sounds
audio_stop_sound(Snd_PistolRacking)
audio_stop_sound(Snd_RifleRacking)
audio_stop_sound(Snd_SmgRacking)
audio_stop_sound(Snd_ShotgunCock)
audio_stop_sound(Snd_ShotgunShellReload)
weapon.alarm[1] = -1;
}

//Shotgun
if (keyboard_check_pressed(ord('4'))) && !(current_weapon = 4) && (can_fire)
{
    ammoreloading = 0;
    alarm[2] = -1;
    current_weapon = 4;
    can_fire = false;
    switchtime = room_speed * .6;
    alarm[1] = switchtime;
    audio_play_sound(Snd_ShotgunCock,1,false);
    var len;
    len = audio_sound_length(Snd_ShotgunShellReload);
    reloadtime = (room_speed * len * 8) + (room_speed * .6);
    weapon.alarm[0] = 1;
    weapon = instance_create(x, y, obj_wpn_shotgun)
    current_ammo = Shotgun_ammoloaded;
    //Stop Other Sounds
audio_stop_sound(Snd_PistolRacking)
audio_stop_sound(Snd_RifleRacking)
audio_stop_sound(Snd_SmgRacking)
audio_stop_sound(Snd_ShotgunShellReload)
weapon.alarm[1] = -1;
}

//Vector
if (keyboard_check_pressed(ord('5'))) && !(current_weapon = 5) && (can_fire)
{
    ammoreloading = 0;
    alarm[2] = -1;
    current_weapon = 5;
    can_fire = false;
    var len;
    len = audio_sound_length(Snd_PistolSwitch);
    audio_play_sound(Snd_PistolSwitch, 1, false);
    switchtime = room_speed * len;
    alarm[1] = switchtime;
    reloadtime = room_speed * len;
    weapon.alarm[0] = 1;
    weapon = instance_create(x, y, obj_wpn_vector)
    current_ammo = Vector_ammoloaded;
    //Stop Other Sounds
audio_stop_sound(Snd_PistolRacking)
audio_stop_sound(Snd_RifleRacking)
audio_stop_sound(Snd_SmgRacking)
audio_stop_sound(Snd_ShotgunCock)
audio_stop_sound(Snd_ShotgunShellReload)
weapon.alarm[1] = -1;
};
