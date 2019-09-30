%% AAE 451 Stall Speed Analysis - Team 7
rho = 1.225; %kg/m3
S = .511; %m^2
Wto = 37.89; %N
We = 20.1; %N

ops = 15; %Operating Speed (m/s)
XFLR = xfoil('Prop_Analysis_Viscous2_Plane.txt','wing');
stallspeed_Glider = sqrt(2.*Wto./rho./S./XFLR.CL);
stallspeed_Empty = sqrt(2.*We./rho./S./XFLR.CL);

figure(1)
subplot(1,2,1)
plot(XFLR.alpha,stallspeed_Glider,[-1.5,15],[ops,ops])
axis([-1.5,15,0,130])
grid on
legend('Stall Speed','Operating Speed')
xlabel('\alpha (\circ)')
ylabel('Stall Speed (m/s)')
title('Stall Speed for Given Angle of Attack (Glider)')
subplot(1,2,2)
plot(XFLR.alpha,stallspeed_Empty,[-1.5,15],[ops,ops])
axis([-1.5,15,0,130])
grid on
legend('Stall Speed','Operating Speed')
xlabel('\alpha (\circ)')
ylabel('Stall Speed (m/s)')
title('Stall Speed for Given Angle of Attack (Empty)')

figure(2)
subplot(1,2,1)
plot(XFLR.alpha,stallspeed_Glider.*1.94384,[-1.5,15],[ops.*1.94384,ops.*1.94384])
axis([-1.5,15,0,200])
grid on
legend('Stall Speed','Operating Speed')
xlabel('\alpha (\circ)')
ylabel('Stall Speed (kts)')
title('Stall Speed for Given Angle of Attack (Glider)')
subplot(1,2,2)
plot(XFLR.alpha,stallspeed_Empty.*1.94384,[-1.5,15],[ops.*1.94384,ops.*1.94384])
axis([-1.5,15,0,200])
grid on
legend('Stall Speed','Operating Speed')
xlabel('\alpha (\circ)')
ylabel('Stall Speed (kts)')
title('Stall Speed for Given Angle of Attack (Empty)')
