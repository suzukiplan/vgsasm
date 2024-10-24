struct OBJ $C000 {
    x ds.b 1
    y ds.b 1
}

.main
    OBJ.x = (256 - 16) / 2                      ; X座標
    OBJ.y = (200 - 16) / 2                      ; Y座標
