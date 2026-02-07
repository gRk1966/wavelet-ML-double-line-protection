function [Indx_ax, Indx_bx, Indx_cx] = Fault_Index_Extraction(ia1, ib1, ic1, ia2, ib2, ic2)
%--------------------------------------------------------------------------
% Fault_Index_Extraction.m
%
% Wavelet energy based high-speed fault detection for transmission lines
%
% Inputs:
%   ia1, ib1, ic1 : Phase current signals (vectors) Terminal1
%   ia2, ib2, ic3 : Phase current signals (vectors) Terminal2
%
% Outputs:
%   Indx_ax  = Fault Index Phase-a
%   Indx_bx  = Fault Index Phase-b
%   Indx_cx  = Fault Index Phase-c)
%
% Author:
%   Dr. Ravi Kumar Goli
%--------------------------------------------------------------------------

%% Wave decomposition
[Cia1,Lia1] = wavedec(ia1,1,'bior1.5');
[Cib1,Lib1] = wavedec(ib1,1,'bior1.5');
[Cic1,Lic1] = wavedec(ic1,1,'bior1.5');
[Cia2,Lia2] = wavedec(ia2,1,'bior1.5');
[Cib2,Lib2] = wavedec(ib2,1,'bior1.5');
[Cic2,Lic2] = wavedec(ic2,1,'bior1.5');

%% Detailed Coefficients
CD1_ia1 = detcoef(Cia1,Lia1,1);
CD1_ib1 = detcoef(Cib1,Lib1,1); 
CD1_ic1 = detcoef(Cic1,Lic1,1); 
CD1_ia2 = detcoef(Cia2,Lia2,1);
CD1_ib2 = detcoef(Cib2,Lib2,1);
CD1_ic2 = detcoef(Cic2,Lic2,1);

CD1_iaxx = (CD1_ia1-CD1_ia2);
CD1_ibxx = (CD1_ib1-CD1_ib2);
CD1_icxx = (CD1_ic1-CD1_ic2);

CD1_iax = abs(CD1_iaxx);
CD1_ibx = abs(CD1_ibxx);
CD1_icx = abs(CD1_icxx);
%% Sum of the Detailed Coefficients
for i= 5:65
    
    Sum_Iax(i) = CD1_iax(i)+CD1_iax(i+1)+CD1_iax(i+2)+CD1_iax(i+3)+CD1_iax(i+4)+CD1_iax(i+5)+CD1_iax(i+6)+CD1_iax(i+7);
    Sum_Ibx(i) = CD1_ibx(i)+CD1_ibx(i+1)+CD1_ibx(i+2)+CD1_ibx(i+3)+CD1_ibx(i+4)+CD1_ibx(i+5)+CD1_ibx(i+6)+CD1_ibx(i+7);
    Sum_Icx(i) = CD1_icx(i)+CD1_icx(i+1)+CD1_icx(i+2)+CD1_icx(i+3)+CD1_icx(i+4)+CD1_icx(i+5)+CD1_icx(i+6)+CD1_icx(i+7);

end
for j=37:2:53
Index_Ia=Sum_Iax(j);
Index_ax(ctr1,ctr2)=Index_Ia;
Index_Ib=Sum_Ibx(j);
Index_bx(ctr1,ctr2)=Index_Ib;
Index_Ic=Sum_Icx(j);
Index_cx(ctr1,ctr2)=Index_Ic;
ctr2=ctr2+1;
end
 Indx_ax=Index_ax;
Indx_bx=Index_bx;
Indx_cx=Index_cx;
end

