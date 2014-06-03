func RGB2HSL(r: Int, g: Int, b: Int) -> (h: Int, s: Int, l: Int) {
    var rf = max(min(Float64(r)/255, 1), 0)
    var gf = max(min(Float64(g)/255, 1), 0)
    var bf = max(min(Float64(b)/255, 1), 0)
    var maxv = max(rf, gf, bf)
    var minv = min(rf, gf, bf)
    var l = (maxv + minv) / 2
    var h = 0.0, s = 0.0, d = 0.0
    
    if maxv != minv {
        d = maxv - minv
        if l > 0.5 {
            s = d / (2 - maxv - minv)
        } else {
            s = d / (maxv + minv)
        }
        if maxv == rf {
            if gf < bf {
                h = (gf - bf) / d + 6
            } else {
                h = (gf - bf) / d
            }
        } else if maxv == gf {
            h = (bf - rf) / d + 2
        } else {
            h = (rf - gf) / d + 4
        }
    } else {
        h = 0
        s = 0
    }
    var hi = Int(h * 60)
    var si = Int(s * 100)
    var li = Int(l * 100)
    return (hi, si, li)
}

RGB2HSL(99, 140, 69)