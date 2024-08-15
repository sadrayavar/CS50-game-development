return function(path, type, loop, volume, pitch)
    local audio = love.audio.newSource(path, type)

    audio:setLooping((loop == 'loop') and (true) or (false))
    audio:setVolume(volume or 1)
    audio:setPitch(pitch or 1)

    return audio
end
