function [fault_type, phase_label] = fault_classification(Indx_ax, Indx_bx, Indx_cx)
%--------------------------------------------------------------------------
% fault_classification.m
%
% Wavelet-energy based fault classification for transmission lines
%
% Inputs:
%   Indx_ax, Indx_bx, Indx_cx : Wavelet energy indices of Phase-A, B, C
%
% Outputs:
%   fault_type  : String describing fault type
%   phase_label : Binary vector [A B C] indicating faulted phases
%
% Author:
%   Dr. Ravi Kumar Goli
%--------------------------------------------------------------------------

%% Normalize energies
Etotal = Indx_ax + Indx_bx + Indx_cx;
Indx_ax_n = Indx_ax / Etotal;
Indx_bx_n = Indx_bx / Etotal;
Indx_cx_n = Indx_cx / Etotal;

%% Phase involvement threshold
th = 0.20;   % Energy participation threshold

phase_label = [0 0 0];

if Indx_ax_n > th
    phase_label(1) = 1;
end
if Indx_bx_n > th
    phase_label(2) = 1;
end
if Indx_cx_n > th
    phase_label(3) = 1;
end

%% Determine fault type
num_phases = sum(phase_label);

switch num_phases
    
    case 1
        % Single line-to-ground fault (LG)
        if phase_label(1)
            fault_type = 'A-G Fault';
        elseif phase_label(2)
            fault_type = 'B-G Fault';
        else
            fault_type = 'C-G Fault';
        end
        
    case 2
        % Line-to-line fault (LL)
        if phase_label(1) && phase_label(2)
            fault_type = 'A-B Fault';
        elseif phase_label(2) && phase_label(3)
            fault_type = 'B-C Fault';
        else
            fault_type = 'C-A Fault';
        end
        
    case 3
        % Three-phase fault
        fault_type = 'Three-Phase Fault (LLL)';
        
    otherwise
        fault_type = 'No Fault / Uncertain';
end

end
