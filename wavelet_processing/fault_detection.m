function [fault_flag, energy_idx, phase_flag] = fault_detection(Indx_ax, Indx_bx ,Indx_cx)
%--------------------------------------------------------------------------
% fault_detection.m
%
% Wavelet energy based high-speed fault detection for transmission lines
%
% Inputs:
%   ia, ib, ic : Phase current signals (vectors)
%   fs         : Sampling frequency (Hz)
%
% Outputs:
%   fault_flag : 1 = Fault detected, 0 = Normal
%   energy_idx : Total wavelet energy index
%   phase_flag : [A B C] phase involvement (1=faulted, 0=healthy)
%
% Author:
%   Dr. Ravi Kumar Goli
%--------------------------------------------------------------------------

%% Total energy index
energy_idx = Indx_ax + Indx_bx + Indx_cx ;

%% -------- Adaptive Threshold --------
% Pre-fault window (first 1/2 cycle approx)
Nprefault = round(fs/50);   % For 50 Hz system
prefault_energy = mean(abs([ia(1:Nprefault) ib(1:Nprefault) ic(1:Nprefault)]));
threshold = 10 * prefault_energy;   % Adaptive scaling

%% -------- Fault Detection --------
if energy_idx > threshold
    fault_flag = 1;
else
    fault_flag = 0;
end

%% -------- Phase Identification --------
phase_flag = [0 0 0];

phase_threshold = 0.25 * energy_idx;

if Indx_ax > phase_threshold
    phase_flag(1) = 1;
end
if Indx_bx > phase_threshold
    phase_flag(2) = 1;
end
if Indx_cx > phase_threshold
    phase_flag(3) = 1;
end

end
