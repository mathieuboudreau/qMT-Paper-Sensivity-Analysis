function [] = plot_sensitivity(protocol, sensitivity_struct, sParam, deltaParamPerc)
%PLOT_SENSITIVITY Summary of this function goes here
%   Detailed explanation goes here

    figure()
    semilogx(protocol(1:2:end,2),abs(sensitivity_struct.sensitivity(1:2:end)),'bo-','LineWidth',2 ,'MarkerSize', 10, 'MarkerFaceColor','b','LineSmoothing','on')
    hold on
    semilogx(protocol(2:2:end,2),abs(sensitivity_struct.sensitivity(2:2:end)),'ro-','LineWidth',2 , 'MarkerSize', 10,'MarkerFaceColor','r','LineSmoothing','on')
    xlim([10^2 10^5])
    my_xlabel('Offset Frequency (Hz)')
    my_ylabel(['s_',sParam])

    set(gca, 'XTick', [10^2 10^3 10^4 10^5])
    set(gca,'XMinorTick','on')

    
    gridlines1 = [2*10^2:10^2:10^3];
    gridlines2 = [2*10^3:10^3:10^4];
    gridlines3 = [2*10^4:10^4:9*10^4];
    gridlines = [gridlines1,gridlines2,gridlines3];
    lims = ylim;
    for ii = 1:length(gridlines)
        plot(linspace(gridlines(ii),gridlines(ii),80),linspace(lims(1),lims(2),80),':','Color',[50 50 50]./256,'LineWidth',1)
        hold on
    end
    
    %title(['Sensitivity of MT signal (\Delta', sParam, ' = ' , num2str(deltaParamPerc),'%)'])
end
 