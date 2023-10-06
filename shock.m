%% Initialization
clc; clear;

%% Initial Conditions
px = .5; Tx = 300; vx_gnd = 150; gamma = 1.4; epsilon = .0001; 
ea = 100; vs = 400; R = 287;

%% Math
while ea > epsilon
    Mx = (vx_gnd + vs) / sqrt(gamma * R * Tx);
    [mach,T,P,rho,downstream_mach] = flownormalshock(gamma,Mx);
    Ty = T * Tx;
    vy = downstream_mach * sqrt(gamma * R * Ty);
    test = vs - vy;
    if test < 0
        dvs = abs(test)/10;
        vs_new = vs + dvs;
    elseif test > 0
        dvs = abs(test)/10;
        vs_new = vs - dvs;
    else
        return
    end

    ea = (abs(vs_new - vs) / vs_new) * 100;
    vs = vs_new;
end

fprintf("The velocity of the shock is: %.3f m/s", vs);