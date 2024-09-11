% rlc_ss.m
% define system model: x' = A(t)x + B(t)u(t)
function xdot = rlc_ss(t, x)
    % Time-varying parameters
    C = 0.01 + 0.001 * t; 
    L = 0.5 + 0.05 * t; 
    R = 1 + 0.02 *t; 
    u = sin(t); 

    % Time derivatives of the parameters
    dC_dt = 0.001; % dC/dt
    dL_dt = 0.05; % dL/dt

    % State-space matrices
    A = [-dC_dt / C, 1 / C;
         -1 / L, (-(R + dL_dt) / L)];
    B = [0; 1 / L];
    
    % Return derivatives
    xdot = A * x + B * u;
end
