%% Calculate area&volume required of wing
%Airfoil Data
naca2412=[
1.0000,     0.0013;
0.9500,     0.0114;
0.9000,     0.0208;
0.8000,     0.0375;
0.7000,     0.0518;
0.6000,     0.0636;
0.5000,     0.0724;
0.4000,     0.0780;
0.3000,     0.0788;
0.2500,     0.0767;
0.2000,     0.0726;
0.1500,     0.0661;
0.1000,     0.0563;
0.0750,     0.0496;
0.0500,     0.0413;
0.0250,     0.0299;
0.0125,     0.0215;
0.0000,     0.0000;
0.0125,     -0.0165;
0.0250,     -0.0227;
0.0500,     -0.0301;
0.0750,     -0.0346;
0.1000,     -0.0375;
0.1500,     -0.0410;
0.2000,     -0.0423;
0.2500,     -0.0422;
0.3000,     -0.0412;
0.4000,     -0.0380;
0.5000,     -0.0334;
0.6000,     -0.0276;
0.7000,     -0.0214;
0.8000,     -0.0150;
0.9000,     -0.0082;
0.9500,     -0.0048;
1.0000,     -0.0013;
1.0000,     0.0013];

naca0010=([
1.0000,     0.00105;
0.9500,     0.00672;
0.9000,     0.01207;
0.8000,     0.02187;
0.7000,     0.03053;
0.6000,     0.03803;
0.5000,     0.04412;
0.4000,     0.04837;
0.3000,     0.05002;
0.2500,     0.04952;
0.2000,     0.04782;
0.1500,     0.04455;
0.1000,     0.03902;
0.0750,     0.03500;
0.0500,     0.02962;
0.0250,     0.02178;
0.0125,     0.01578;
0.0000,     0.00000;
0.0125,     -0.01578;
0.0250,     -0.02178;
0.0500,     -0.02962;
0.0750,     -0.03500;
0.1000,     -0.03902;
0.1500,     -0.04455;
0.2000,     -0.04782;
0.2500,     -0.04952;
0.3000,     -0.05002;
0.4000,     -0.04837;
0.5000,     -0.04412;
0.6000,     -0.03803;
0.7000,     -0.03053;
0.8000,     -0.02187;
0.9000,     -0.01207;
0.9500,     -0.00672;
1.0000,     -0.00105;
1.0000,      0.00105;]);

%Scaling and plotting
%plot(naca2412(:,1),naca2412(:,2))
%plot(naca0010(:,1),naca0010(:,2))
wing = naca2412.*.32;
elev = naca0010.*.223;

subplot(2,1,1)
plot(wing(:,1),wing(:,2))
axis([0,.32,-.1,.1])
xlabel('x (m)')
ylabel('y (m)')
title('Wing: NACA 2412')
grid on
subplot(2,1,2)
plot(elev(:,1),elev(:,2))
axis([0,.223,-.1,.1])
xlabel('x (m)')
ylabel('y (m)')
title('Elevator: NACA 0010')
grid on

%Wing Analysis
wingarea = polyarea(wing(:,1),wing(:,2));
wingspan = 1.6;
WingVol = wingarea*wingspan;
rho_pla = 1250; %kg/m3
WingWeight = WingVol*rho_pla;
fprintf('       WingArea = %8.04f m2\n',wingarea)
fprintf('       WingSpan = %8.04f m\n',wingspan)
fprintf('        WingVol = %8.04f m3\n',WingVol)
fprintf('     WingWeight = %8.04f kg\n\n',WingWeight)

%Elevator Analysis
elevarea = polyarea(elev(:,1),elev(:,2));
elevspan = .7;
ElevVol = elevarea*elevspan;
ElevWeight = ElevVol*rho_pla;
fprintf('       ElevArea = %8.04f m2\n',elevarea)
fprintf('       ElevSpan = %8.04f m\n',elevspan)
fprintf('        ElevVol = %8.04f m3\n',ElevVol)
fprintf('     ElevWeight = %8.04f kg\n\n',ElevWeight)

%CarbonFiber Rod Analysis
rho_CF = 2000; %kg/m3
area_CF = (pi*(.25*2.54/2)^2)*2/100/100; %m^2
vol_CF_Wing = wingspan*area_CF; %m3
vol_CF_Elev = elevspan*area_CF; %m3
CF_Weight_Wing = rho_CF*vol_CF_Wing;
CF_Weight_Elev = rho_CF*vol_CF_Elev;
fprintf('   WingCFiberWt = %8.04f kg\n',CF_Weight_Wing)
fprintf('   ElevCFiberWt = %8.04f kg\n\n',CF_Weight_Elev)

%Conclusion
fprintf('To meet .8kg, the   wing   must be %8.04f %% filled or less\n',...
    (.8-CF_Weight_Wing)/(WingWeight)*100)
fprintf('To meet .2kg, the elevator must be %8.04f %% filled or less\n',...
    (.2-CF_Weight_Elev)/(ElevWeight)*100)