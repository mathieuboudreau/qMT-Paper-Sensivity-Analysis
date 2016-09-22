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

mkdir('temp')

%startup;                    

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

deltaFPerc_range = 10^(-5);
sParam = 'F'
for ii = 1:length(deltaFPerc_range)
    deltaParam = deltaFPerc_range(ii);
    sensitivity_F{ii} = simulate_sensitivity(protocolFlag, sTissueParameters, sMeasurementParameters, sParam, deltaParam)
end

%%
%

load(sMeasurementParameters)

plot_sensitivity(protocol,sensitivity_F{1},'F',deltaFPerc_range(1))

my_ylabel('{|s_{\fontsize{24}F}|}')
axis square
xlabel([])
ylabel([])
%axis([10^2 10^6 -1.5 0.01])

%%
%

deltakfPerc_range = 10^(-5);
sParam = 'kf'
for ii = 1:length(deltakfPerc_range)
    deltaParam = deltakfPerc_range(ii);
    sensitivity_kf{ii} = simulate_sensitivity(protocolFlag, sTissueParameters, sMeasurementParameters, sParam, deltaParam)
end

%%
%

load(sMeasurementParameters)
plot_sensitivity(protocol,sensitivity_kf{1},'k_f',deltaFPerc_range(1))
my_ylabel('{|s_{\fontsize{24}kf}|}')
axis square
xlabel([])
ylabel([])
%axis([10^2 10^6 -1.5 0.01])



%%
%

deltab1Perc_range = 10^(-5);
sParam = 'b1'
for ii = 1:length(deltab1Perc_range)
    deltaParam = deltab1Perc_range(ii);
    sensitivity_b1{ii} = simulate_sensitivity(protocolFlag, sTissueParameters, sMeasurementParameters, sParam, deltaParam)
end

%%
%

load(sMeasurementParameters)

plot_sensitivity(protocol,sensitivity_b1{1},'b__1',deltab1Perc_range(1))
my_ylabel('{|s_{\fontsize{24}B1}^{\fontsize{16}IR}|}')
axis square
xlabel([])
ylabel([])


%%
%

deltab1t1Perc_range = 10^(-5);
sParam = 'b1t1'
for ii = 1:length(deltab1t1Perc_range)
    deltaParam = deltab1t1Perc_range(ii);
    sensitivity_b1t1{ii} = simulate_sensitivity(protocolFlag, sTissueParameters, sMeasurementParameters, sParam, deltaParam)
end

%%
%

load(sMeasurementParameters)

plot_sensitivity(protocol,sensitivity_b1t1{1},'B__1_T__1',deltab1t1Perc_range(1))
my_ylabel('{|s_{\fontsize{24}B1}^{\fontsize{16}VFA}|}')

    legend_cell{1}='MT FA = 142^{o}';
    legend_cell{2}='MT FA = 426^{o}';
    my_legend(legend_cell)
axis square
xlabel([])
ylabel([])
%%
%

deltat2fPerc_range = 10^(-5);
sParam = 't2f'
for ii = 1:length(deltat2fPerc_range)
    deltaParam = deltat2fPerc_range(ii);
    sensitivity_t2f{ii} = simulate_sensitivity(protocolFlag, sTissueParameters, sMeasurementParameters, sParam, deltaParam)
end

%%
%

load(sMeasurementParameters)

plot_sensitivity(protocol,sensitivity_t2f{1},'T__2__f',deltat2fPerc_range(1))
my_ylabel('{|s_{\fontsize{24}T2f}|}')
axis square
xlabel([])
ylabel([])
%%
%

deltat2rPerc_range = 10^(-5);
sParam = 't2r'
for ii = 1:length(deltat2rPerc_range)
    deltaParam = deltat2rPerc_range(ii);
    sensitivity_t2r{ii} = simulate_sensitivity(protocolFlag, sTissueParameters, sMeasurementParameters, sParam, deltaParam)
end

%%
%

load(sMeasurementParameters)

plot_sensitivity(protocol,sensitivity_t2r{1},'T__2__r',deltat2rPerc_range(1))
my_ylabel('{|s_{\fontsize{24}T2r}|}')
axis square
ax = gca;
ax.YAxis.Exponent = 3;
xlabel([])
ylabel([])
