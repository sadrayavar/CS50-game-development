-- import assets
fonts = require 'assets.fonts.fonts'
images = require "assets.images.images"
sounds = require "assets.sounds.sounds"
musics = require "assets.musics.musics"

-- import libraries
Class = require "dep.lib.class"
Push = require "dep.lib.push"
Bird = require 'dep.bird'
Pipe = require 'dep.pipe'
isCollide = require 'dep.physics.collide'
getState = require 'dep.physics.state'
StateMachine = require "dep.lib.StateMachine"

-- import states
require 'states.BaseState'
require 'states.PlayState'
require 'states.TitleState'

-- import main love functions (in order of executin)
require 'main_funcs.load'
require 'main_funcs.resize'
require 'main_funcs.keypressed'
require 'main_funcs.update'
require 'main_funcs.draw'
