-- gravity
GRAVITY = 9 -- (difficulty handle)

-- bird jumping velocity
ANTI_GRAVITY = GRAVITY * 0.3

collusion = 0

birdMargin = {
    ['top'] = 1.5,
    ['right'] = 1.5,
    ['left'] = 1.5,
    ['bottom'] = 1.5
}

bird = Bird()
