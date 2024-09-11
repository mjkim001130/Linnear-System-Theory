% rlc_sys.m
% define system model: x' = A(t)x + B(t)u(t)
function xdot = rlc_sys(t, x)
    % Time-varying parameters
    C = 0.01 + 0.001 * t; 
    L = 0.5 + 0.05 * t; 
    R = 1 + 0.02 *t; 
    u = sin(t); 

    % Time derivatives of the parameters
    dC_dt = 0.001; % dC/dt
    dL_dt = 0.05; % dL/dt

    % State-space model
    Vc = x(1); 
    I = x(2); 
    
    dVc_dt = (-dC_dt / C) * Vc + (1 / C) * I;
    dI_dt = (-1 / L) * Vc + (-(R + dL_dt) / L) * I + (1 / L) * u;
    
    % Return derivatives
    xdot = [dVc_dt; dI_dt];
end
