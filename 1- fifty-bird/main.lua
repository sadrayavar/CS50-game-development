-- import constants
require "constants.screen"
require "constants.physics"

-- import assets
fonts = require('assets.fonts.fonts')
images = require("assets.images.images")
sounds = require("assets.sounds.sounds")
musics = require("assets.musics.musics")

-- import libraries
Class = require "dep.lib.class"
Push = require "dep.lib.push"

-- import physics related methods
isCollide = require 'dep.physics.collide'
getState = require 'dep.physics.state'

-- import classes
Bird = require 'dep.bird'
Pipe = require 'dep.pipe'

-- import main love functions (in order of executing)
require 'main_funcs.load'
require 'main_funcs.resize'
require 'main_funcs.keypressed'
require 'main_funcs.update'
require 'main_funcs.draw'
