-- sounds root path
local rootPath = "assets/sounds/"
local sounds = {
    ['lost'] = "lost.mp3",
    ['score'] = "score.mp3",
    ['jump'] = "jump.mp3",
    ['countdown'] = "countdown.wav",
    ['start'] = "start.wav",
    ['click'] = "click.mp3",
    ['pause'] = "pause.mp3"
}

for key, path in pairs(sounds) do
    sounds[key] = function(loop)
        return GLOB.genAudio(rootPath .. path, 'static', loop, GLOB.game.volume[key])
    end
end

return sounds
