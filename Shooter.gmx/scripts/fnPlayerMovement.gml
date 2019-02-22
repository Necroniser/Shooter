var moving;
moving = false;

//Controller Support
gamepad_set_axis_deadzone(0,0.01)

spd = movespeed

//Sprinting
if ((keyboard_check(vk_shift)) || (gamepad_button_check(0,gp_shoulderlb))) && (stamina >= staminauserate) && (!(vspeed==0) || !(hspeed==0))
{
    spd = sprint_speed;
    stamina -= staminauserate;
}
else
if (stamina <= 200-staminaregainrate) && !(keyboard_check(vk_shift))
{stamina += staminaregainrate;}

if (place_meeting(x, y, Obj_speed_modifier))
{
    var o_spd_mod;
    o_spd_mod = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, Obj_speed_modifier, false, true)
    if (instance_exists(o_spd_mod))
    {
        spd = spd * o_spd_mod.speed_modifier;
    }
}

//Movement

if (keyboard_check(ord('W'))) || (gamepad_axis_value(0,gp_axislv)<0){
    vspeed = -spd
    moving = true;
}
else if (keyboard_check(ord('S'))) || (gamepad_axis_value(0,gp_axislv)>0){
    vspeed = spd
    moving = true;
}
else {
    vspeed = 0
}

if (keyboard_check(ord('A'))) || (gamepad_axis_value(0,gp_axislh)<0){
    hspeed = -spd
    moving = true;
}

else if (keyboard_check(ord('D'))) || (gamepad_axis_value(0,gp_axislh)>0){
    hspeed = spd
    moving = true;
}
else {
    hspeed = 0
}
if (vspeed == 0)&&(hspeed==0)
{moving=false;}
if gamepad_is_connected(0)
{
fahaxis = gamepad_axis_value(0,gp_axisrh);
favaxis = gamepad_axis_value(0,gp_axisrv);
if (fahaxis != 0) || (favaxis != 0)
{
facing = point_direction(0,0,fahaxis,favaxis);
};
}
else
{
facing = point_direction(x, y, mouse_x, mouse_y);
};

//Walking Sounds
if (moving==true) && (alarm[3] == -1)
{
obj_player.alarm[3] = ((.75/obj_player.spd)*room_speed);
};

//Reload
if ((keyboard_check_pressed(ord('R'))) || (gamepad_button_check_pressed(0,gp_face3))) && can_fire && (current_ammo<weapon.magazine_size){
        switch(current_weapon)
        {
         //Pistol
         case 1: 
         if (totalPistol_ammo>(weapon.magazine_size-current_ammo))
         {
         ammoreloading = weapon.magazine_size;
         totalPistol_ammo -= (weapon.magazine_size - current_ammo);
         }
         else
         {
         ammoreloading = totalPistol_ammo+current_ammo;
         totalPistol_ammo=0;
         }
         var len;
         len = audio_sound_length(Snd_PistolRacking);
         audio_play_sound(Snd_PistolRacking, 1, false);
         alarm[2] = room_speed * len;
         can_fire = false;
         break;
         //SMG
         case 2: 
         if (totalSMG_ammo>(weapon.magazine_size-current_ammo))
         {
         ammoreloading = weapon.magazine_size;
         totalSMG_ammo -= (weapon.magazine_size - current_ammo)
         }
         else
         {
         ammoreloading = totalSMG_ammo+current_ammo;
         totalSMG_ammo=0;
         }
         var len;
         len = audio_sound_length(Snd_SmgRacking);
         audio_play_sound(Snd_SmgRacking, 1, false);
         alarm[2] = room_speed * len;
         can_fire = false;
         break;
         //Rifle
         case 3: 
          if (totalRifle_ammo>(weapon.magazine_size-current_ammo))
         {
         ammoreloading = weapon.magazine_size;
         totalRifle_ammo -= (weapon.magazine_size - current_ammo)
         }
         else
         {
         ammoreloading = totalRifle_ammo+current_ammo;
         totalRifle_ammo=0;
         }
         var len;
         len = audio_sound_length(Snd_RifleRacking);
         audio_play_sound(Snd_RifleRacking, 1, false);
         alarm[2] = room_speed * len;
         can_fire = false;
         break;
         //Shotgun
         case 4:
         if (totalShotgun_ammo>(weapon.magazine_size-current_ammo))
         {
         ammoreloading = weapon.magazine_size;
         totalShotgun_ammo -= (weapon.magazine_size - current_ammo)
         }
         else
         {
         ammoreloading = totalShotgun_ammo+current_ammo;
         totalShotgun_ammo=0;
         }
         var len;
         len = audio_sound_length(Snd_ShotgunShellReload);
         audio_play_sound(Snd_ShotgunShellReload, 1, true);
         alarm[2] = (room_speed * len * (8 - current_ammo)) + (room_speed * .65);
         weapon.alarm[1] = (room_speed * (audio_sound_length(Snd_ShotgunShellReload)) * (8 - current_ammo));
         can_fire = false;
         break;
         //Vector
         case 5: 
         if (totalVector_ammo>(weapon.magazine_size-current_ammo))
         {
         ammoreloading = weapon.magazine_size;
         totalVector_ammo -= (weapon.magazine_size - current_ammo)
         }
         else
         {
         ammoreloading = totalVector_ammo+current_ammo;
         totalVector_ammo=0;
         }
         var len;
         len = audio_sound_length(Snd_PistolRacking);
         audio_play_sound(Snd_PistolRacking, 1, false);
         alarm[2] = room_speed * len;
         can_fire = false;
         break;  
        } 
};

//Player Death
if hp <= 0
{ 
room_goto(Room_Gameover);
};
