local musics = {
    ['play'] = 'Luke-Bergs-Bliss(chosic.com).mp3',
    ['menu'] = 'Luke-Bergs-Take-It-Easy(chosic.com).mp3'
}

for key, path in pairs(musics) do
    local rootPath = "assets/musics/"

    musics[key] = function(loop)
        return GLOB.genAudio(rootPath .. path, 'stream', loop, GLOB.game.volume[key])
    end
end

return musics
