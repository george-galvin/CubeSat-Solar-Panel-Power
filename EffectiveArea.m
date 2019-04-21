function [EA] = EffectiveArea(lat,long)

%In this satellite-centric reference frame, lat is the effective LATITUDE of the sun, 
% which is 0 between LMB1 and RMB1, and is positive in the direction of RMB1.

%long is the effective LONGITUDE of the sun, which is 0 when level with the solar panel.

%measurements in m of the height and width of the DEPLOYABLE and BODY-MOUNTED panels.
D_Height = .3;
BM_Height = .3;
D_Width = .1;
BM_Width = .1;

AreaEfficiency = 0.018820305 / 0.03;

LBM1_Effective = EffectiveLength(lat + pi/2, BM_Width, D_Width) * BM_Height;
LBM2_Effective = 0; %In this satellite LMB2 doesn't have a panel
RBM1_Effective = EffectiveLength(-lat + pi/2, BM_Width, D_Width) * BM_Height;
RBM2_Effective = EffectiveLength(lat - pi/2, BM_Width, D_Width) * BM_Height;

LD1_Effective = EffectiveLength(pi/4 - lat, D_Width, BM_Width) * D_Height;
LD2_Effective = EffectiveLength(lat - 3*pi/4, D_Width, BM_Width) * D_Height;
RD1_Effective = EffectiveLength(lat - 7*pi/4, D_Width, BM_Width) * D_Height;
RD2_Effective = EffectiveLength(5*pi/4 - lat, D_Width, BM_Width) * D_Height;

EA = (LBM1_Effective + LBM2_Effective + RBM1_Effective + RBM2_Effective ...
    + LD1_Effective + LD2_Effective + RD1_Effective + RD2_Effective) * cos(long) * AreaEfficiency;
end

