if (place_meeting(x + hspeed, y, Obj_block))
{
    hspeed = 0
}
if (place_meeting(x, y + vspeed, Obj_block))
{
    vspeed = 0
}
if (place_meeting(x+hspeed,y,Obj_SolidFurniture))
{
    hspeed = 0
}
if (place_meeting(x,y+vspeed,Obj_SolidFurniture))
{
    vspeed = 0
}
