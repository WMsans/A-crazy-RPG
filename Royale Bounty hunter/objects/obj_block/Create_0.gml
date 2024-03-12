/// @description set up shadow caster
event_inherited();

actually_showing = false;

polygon = polygon_from_instance(id);

flags |= eShadowCasterFlags.Static;
