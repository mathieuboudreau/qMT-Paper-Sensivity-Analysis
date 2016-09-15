function [output_struct] = simulate_sensitivity(protocolFlag, sTissueParameters, sMeasurementParameters, sParam, deltaParamPerc)
%SIMULATE_SENSITIVITY Summary of this function goes here
%   sTissueParameters
%   sMeasurementParameters
%   sParam = 
%   deltaParam

    %% Calculate true signal
    
    load(sMeasurementParameters)

    [sled_flips sled_offsets sled_pulse_durations sled_trs sled_excite_flips] = create_protocol_sled(protocol);
    for ii=1:length(protocol)
       mt_measurement(ii) = sim_qmtspgr_singlepoint(protocol,ii,sTissueParameters, protocolFlag);
    end

    output_struct.trueMeas=cell2mat(mt_measurement');
    
    %% Calculate signal variation
    
        if strcmp(sParam,'b1')
            deltaParamFrac =1+deltaParamPerc/100;

            load(sMeasurementParameters)
            protocol(:,1)=protocol(:,1).*deltaParamFrac;
            protocol(:,5)=protocol(:,5).*deltaParamFrac;
            
            [sled_flips sled_offsets sled_pulse_durations sled_trs sled_excite_flips] = create_protocol_sled(protocol);
        elseif strcmp(sParam,'b1t1')
            deltaParamFrac =1+deltaParamPerc/100;

            load(sMeasurementParameters)
            protocol(:,1)=protocol(:,1).*deltaParamFrac;
            protocol(:,5)=protocol(:,5).*deltaParamFrac;
            
            modify_tissue_param(sTissueParameters, sParam, deltaParamPerc)
            sTissueParameters = ['temp/', sTissueParameters, '_', sParam, '_deltaPerc_', num2str(deltaParamPerc),'.mat'];

            [sled_flips sled_offsets sled_pulse_durations sled_trs sled_excite_flips] = create_protocol_sled(protocol);
        else
            load(sMeasurementParameters)

            modify_tissue_param(sTissueParameters, sParam, deltaParamPerc)
            sTissueParameters = ['temp/', sTissueParameters, '_', sParam, '_deltaPerc_', num2str(deltaParamPerc),'.mat'];

            [sled_flips sled_offsets sled_pulse_durations sled_trs sled_excite_flips] = create_protocol_sled(protocol);
        end
    for ii=1:length(protocol)
       mt_measurement(ii) = sim_qmtspgr_singlepoint(protocol,ii,sTissueParameters, protocolFlag);
    end

    output_struct.deltaMeas=cell2mat(mt_measurement');
    
    %%
    
    output_struct.sensitivity = (output_struct.deltaMeas-output_struct.trueMeas)./(0.1220*(deltaParamPerc/100));
     
end

