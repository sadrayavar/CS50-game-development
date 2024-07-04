-- the fraction of current gap that the next one can transit
gapTrans = 0.5 -- (difficulty handle)

-- new gap range
gapRange = {
    ['low'] = 75, -- (difficulty handle)
    ['high'] = 100 -- (difficulty handle)
}

-- used to save the point in which the new gap will be transmitted from
lastPipe = {
    ['y'] = VIRTUAL_HEIGTH / 2
}
