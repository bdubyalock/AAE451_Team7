% This function is designed to read exported files from XFLR5 v6.
% filepath: type=string
%           should reflect the path of the file to be read and
%           include file extention.
%           Example: 'HW4_Polars\NACA 0004_T1_Re0.001_M0.00_N9.0.txt'
%     type: type=string,
%           options: 'graph' - Polar
%                    'oppoints' - BL Data
%                    'foil' - Airfoil Data
%                    'Cp' - Cp Graph Data
%                    'wing' - Wing Analysis Polar Data
% outputs as structure
%

function xfoil = xfoil(filepath,type)
if strcmp(type,'graph') == 1
    fid = fopen(filepath,'rt');
    indata = textscan(fid, '%f %f %f %f %f %f %f %f %f %f', 'HeaderLines',11);
    fclose(fid);
    xfoil.alpha = indata{1,1};
    xfoil.CL = indata{1,2};
    xfoil.CD = indata{1,3};
    xfoil.CDp = indata{1,4};
    xfoil.Cm = indata{1,5};
    xfoil.TopXtr = indata{1,6};
    xfoil.BotXtr = indata{1,7};
    xfoil.Cpmin = indata{1,9};
    xfoil.Chinge = indata{1,9};
    xfoil.XCp = indata{1,10};
elseif strcmp(type,'oppoints')
    %Get Top Side
    fid = fopen(filepath,'rt');
    indata = textscan(fid, '%f %f %f %f %f %f %f %f %f %f', 'HeaderLines',7);
    fclose(fid);
    xfoil.top.x = indata{1,1};
    xfoil.top.Hk = indata{1,2};
    xfoil.top.Ue_Vinf = indata{1,3};
    xfoil.top.Cf = indata{1,4};
    xfoil.top.Cd = indata{1,5};
    xfoil.top.A_A0 = indata{1,6};
    xfoil.top.D_star = indata{1,7};
    xfoil.top.Theta = indata{1,9};
    xfoil.top.CTq = indata{1,9};
    xfoil.top.XCp = indata{1,10};
    %Get Bottom Side
    fid = fopen(filepath,'rt');
    indata = textscan(fid, '%f %f %f %f %f %f %f %f %f %f', 'HeaderLines',74);
    fclose(fid);
    xfoil.bottom.x = indata{1,1};
    xfoil.bottom.Hk = indata{1,2};
    xfoil.bottom.Ue_Vinf = indata{1,3};
    xfoil.bottom.Cf = indata{1,4};
    xfoil.bottom.Cd = indata{1,5};
    xfoil.bottom.A_A0 = indata{1,6};
    xfoil.bottom.D_star = indata{1,7};
    xfoil.bottom.Theta = indata{1,9};
    xfoil.bottom.CTq = indata{1,9};
    xfoil.bottom.XCp = indata{1,10};
elseif strcmp(type,'foil')
    fid = fopen(filepath,'rt');
    indata = textscan(fid, '%f %f', 'HeaderLines',1);
    fclose(fid);
    xfoil.x = indata{1,1};
    xfoil.y = indata{1,2};
elseif strcmp(type,'cp')
    fid = fopen(filepath,'rt');
    indata = textscan(fid, '%f %f', 'HeaderLines',1);
    fclose(fid);
    xfoil.top.x = indata{1,1}(1:49);
    xfoil.bottom.x = indata{1,1}(50:99);
    xfoil.top.y = indata{1,2}(1:49);
    xfoil.bottom.y = indata{1,2}(50:99);
elseif strcmp(type,'wing') == 1
    fid = fopen(filepath,'rt');
    indata = textscan(fid, '%f %f %f %f %f %f %f %f %f %f %f %f %f', 'HeaderLines',8);
    fclose(fid);
    xfoil.alpha = indata{1,1};
    xfoil.Beta = indata{1,2};
    xfoil.CL = indata{1,3};
    xfoil.CDi = indata{1,4};
    xfoil.CDv = indata{1,5};
    xfoil.CD = indata{1,6};
    xfoil.CY = indata{1,7};
    xfoil.Cl = indata{1,9};
    xfoil.Cm = indata{1,9};
    xfoil.XCn = indata{1,10};
    xfoil.Cni = indata{1,11};
    xfoil.QInf = indata{1,12};
    xfoil.XCP = indata{1,13};
end