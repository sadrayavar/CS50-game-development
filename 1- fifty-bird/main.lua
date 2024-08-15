-- import Globals.lua to support global usage on assets
initGlobals = require 'dep.globals.globals'

-- import assets
fonts = require 'assets.fonts.fonts'
images = require "assets.images.images"
sounds = require "assets.sounds.sounds"
musics = require "assets.musics.musics"

-- import libraries
Push = require "dep.lib.Push"
Class = require "dep.lib.Class"
StateMachine = require "dep.lib.stateMachine"
isCollide = require 'dep.lib.physics.collide'
getState = require 'dep.lib.physics.state'

-- import classes
Bird = require 'dep.classes.Bird'
Pipe = require 'dep.classes.Pipe'
PipePair = require 'dep.classes.PipePair'

-- import states
BaseState = require 'dep.states.BaseState'
PlayState = require 'dep.states.PlayState'
PauseState = require 'dep.states.PauseState'
TitleState = require 'dep.states.TitleState'
CountdownState = require 'dep.states.CountdownState'
ScoreState = require 'dep.states.ScoreState'

-- import main love functions (in order of execution)
require 'dep.main_funcs.load'
require 'dep.main_funcs.resize'
require 'dep.main_funcs.keypressed'
require 'dep.main_funcs.update'
require 'dep.main_funcs.draw'
