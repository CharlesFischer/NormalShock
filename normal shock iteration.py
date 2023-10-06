import gas_dynamics.whl as gd

px = .5
Tx = 300
vx_gnd = 150
gamma = 1.4
epsilon = .0001
ea = 100
vs = 400
R = 287

while ea > epsilon:
    Mx = (vx_gnd + vs) / sqrt(gamma * R * Tx)
    T = gd.temperature_ratio(Mx)
    My = gd.shock_mach(Mx)
    Ty = T * Tx
    vy = My * sqrt(gamma * R * Ty)
    test = vs - vy
    if test < 0:
        dvs = abs(test)/10
        vs_new = vs + dvs
    elif test > 0:
        dvs = abs(test)/10
        vs_new = vs - dvs
    else:
        break

    ea = (abs(vs_new - vs) / vs_new) * 100
    vs = vs_new

    continue

print(vs)
