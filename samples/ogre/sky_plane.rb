#!/usr/bin/ruby -w

$:.unshift File.expand_path(File.join(File.dirname(__FILE__),'..','..','lib', 'ogre'))
require 'application'

include Ogre

class SkyPlaneApplication < Application
  def create_scene
    scene_manager.set_ambient_light ColourValue.new(0.5, 0.5, 0.5, 1.0)
  
    plane = Plane.new
    plane.d = 5000
    plane.normal = Vector3.new(0, -1, 0)
    scene_manager.set_sky_plane(true, plane, "Examples/SpaceSkyPlane", 10000, 3, 
                                true, 0, 1, 1, ResourceGroupManager::DEFAULT_RESOURCE_GROUP_NAME)

    light = scene_manager.create_light("MainLight")
    light.set_position_0(20, 80, 50)

#    dragon = scene_manager.create_entity("dragon", "dragon.mesh")
#    scene_manager.get_root_scene_node.attach_object(dragon)
  end
end

app = SkyPlaneApplication.new
app.go
