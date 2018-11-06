//Check For Shooting Status
var fire_activated;
fire_activated = false;

if (weapon.auto == true  && mouse_check_button(mb_left)) { 
    fire_activated = true; 
}

if (weapon.auto == false && mouse_check_button_pressed(mb_left)) { 
    fire_activated = true; 
}

//Check For Empty Clip
if mouse_check_button_pressed(mb_left) and can_fire and current_ammo = 0
{
    audio_play_sound(Snd_EmptyClip,1,false);
}

//Playing Audio
if (fire_activated and can_fire and current_ammo > 0) {
    can_fire = false;
    full_spread = weapon.spread_base + weapon_spread;
    half_spread = full_spread / 2;
    bullet_dir = facing + random(full_spread) - half_spread;
    if current_weapon == 5 || current_weapon == 2  //Vector and SMG
    {
        audio_play_sound(Snd_Gunshot2,1,false);
    }
    else
    if current_weapon == 1 || current_weapon == 3  //Pistol and Rifle
    {
        audio_play_sound(Snd_Gunshot3,1,false);
    }
    else
    if current_weapon == 4                         //Shotgun
    {
        audio_play_sound(Snd_ShotgunShot,1,false);
        weapon.alarm[1] = 24;
    }
    else                                           //Currently none
    {
        audio_play_sound(Snd_NormalGunshot,1,false);
    }
  //Creating Bullets
    for (i=0; i<weapon.bullets_per_shot; i++) {
        b = instance_create(x, y, obj_bullet);
        firing_dir = bullet_dir + random(weapon.spread_bullet_variance) - weapon.spread_bullet_variance / 2;
        b.direction = firing_dir;
        b.image_angle = firing_dir;
        b.speed = weapon.bullet_speed;
        b.damage = weapon.damage;
    }
  //Weapon Spread Growth
    if (weapon_spread < weapon.max_weapon_spread) {
        weapon_spread += weapon.spread_growth
    }
  //Inter-Bullet Timing and Ammo Control
    alarm[1] = weapon.fire_rate                      
    current_ammo -= weapon.ammo_used_per_shot;
    weapon.ammoloaded -= weapon.ammo_used_per_shot;
}

if (weapon_spread > 0)                           //Recovering Weapon Spread
{
    weapon_spread -= min(spread_decay, weapon_spread);
}
