return function()
    GLOB = {}

    GLOB.game = require 'dep.globals.variables.game'()
    GLOB.bird = require 'dep.globals.variables.bird'()
    GLOB.gap = require 'dep.globals.variables.gap'()
    GLOB.pipe = require 'dep.globals.variables.pipe'()
    -- functions
    GLOB.genAudio = require 'dep.globals.functions.generateAudio'
end
