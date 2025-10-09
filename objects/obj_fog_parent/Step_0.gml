var minDistance = 128
var maxDistance = 192

var lerp_factor = (distance_to_object(obj_snail) - minDistance) / (minDistance - maxDistance)
lerp_factor = clamp(lerp_factor, 0, 1)

image_alpha = lerp(1, 0, lerp_factor)