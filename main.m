%% qMT Sensitivity Analysis
% Version: 0.1
%
% PROJECT MANAGER: Mathieu Boudreau (_MJB)
% DESCRIPTION: This code explores numerically the sensitivity of the qMT
% signal for different delta parameters.
%
% LAST EDITED BY: Mathieu Boudreau (_MJB)
%
 

%% Clear Matlab
%

clear all
clc
close all

%% Startup
%

my_path;

startup;                    

set(0, 'DefaultAxesBox', 'on', 'DefaultAxesLineWidth', 6);
set(0, 'DefaultAxesFontSize', 30, 'DefaultAxesFontWeight', 'bold');

%% Set Measurement Parameters
%

sMeasurementParameters = 'UKProtocol_3T';

protocolFlag = 'custom';

%% Set Tissue Parameters
%

sTissueParameters = 'wm_mt_system_params_3t';

%%
%

deltaFPerc_range = logspace(-5,2,32);
sParam = 'F'
for ii = 1:length(deltaFPerc_range)
    deltaParam = deltaFPerc_range(ii);
    sensitivity_F{ii} = simulate_sensitivity(protocolFlag, sTissueParameters, sMeasurementParameters, sParam, deltaParam)
end


%%
%
load(sMeasurementParameters)
for ii = length(sensitivity_F):-1:1
    plot_sensitivity(protocol,sensitivity_F{ii},'F',deltaFPerc_range(ii))
    pause(1)
end


%%
%
for ii = length(sensitivity_F):-1:1
    aSensitivityF(ii,:)=sensitivity_F{ii}.sensitivity(:);
end

figure()
mesh(protocol(1:2:end,2), deltaFPerc_range, aSensitivityF(:,1:2:end))
set(gca,'Xscale','log')
set(gca,'Yscale','log')
hold on
mesh(protocol(2:2:end,2), deltaFPerc_range, aSensitivityF(:,2:2:end))

figure()
[x,y]=meshgrid(protocol(1:2:end,2), deltaFPerc_range);
plot3(x,y, aSensitivityF(:,1:2:end),'-b','LineWidth',3 , 'LineSmoothing','on')
set(gca,'Xscale','log')
set(gca,'Yscale','log')

hold on
[x,y]=meshgrid(protocol(2:2:end,2), deltaFPerc_range);
plot3(x,y, aSensitivityF(:,2:2:end),'-r','LineWidth',3 , 'LineSmoothing','on')

%%
%

clrB = logspace(-0.5,0,5)';
clrB(:,2:3) = 0;
clrB = fliplr(clrB);
clrB = flipud(clrB);


clrR = logspace(-0.5,0,5)';
clrR(:,2:3) = 0;
clrR = flipud(clrR);


figure()
for ii=1:length(protocol(1:2:end,2))
   temp = aSensitivityF(:,1:2:end);
   semilogx(deltaFPerc_range,temp(:,ii),'LineWidth', 3, 'Color',clrB(ii,:))
   hold on
   
   temp = aSensitivityF(:,2:2:end);
   semilogx(deltaFPerc_range,temp(:,ii),'LineWidth', 3, 'Color',clrR(ii,:))
end

load(sMeasurementParameters)

plot_sensitivity(protocol,sensitivity_F{1},'F',deltaFPerc_range(1))

