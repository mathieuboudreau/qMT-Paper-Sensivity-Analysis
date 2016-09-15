function [] = modify_tissue_param(sTissueParameters, sParam, deltaParamPerc)
%MODIFY_TISSUE_PARAM Summary of this function goes here
%   Detailed explanation goes here
    
    load(sTissueParameters)
    
    deltaParamFrac =1+deltaParamPerc/100;
    
    switch sParam
        case 'F'
            m0(2) = m0(2)*deltaParamFrac;
            k_solid_liquid = k_liquid_solid/m0(2); 
            r = k_liquid_solid/m0(2);
        case 'kf'
            k_liquid_solid = k_liquid_solid*deltaParamFrac;
            k_solid_liquid = k_liquid_solid/m0(2); 
            r = k_liquid_solid/m0(2);   
        case 'b1t1'
            disp('bonjour')
            
            a=1;
            b=k_solid_liquid-r1(2)+r1(1)+k_liquid_solid;
            c=-k_solid_liquid*(r1(2)-r1(1));
            
            r1p=r1(2)-(-b+sqrt(b^2-4*a*c))/(2*a)
            t1p=1/r1p
       
            
            [T1error, ~, ~, ~] = estimateVFAT1Error(t1p,0.015,[3 20], deltaParamFrac)
            rd = r1(2) - 1/T1error;
            r1(1) = 1/T1error  - k_liquid_solid * rd /(rd + k_solid_liquid)
        case 't2f'
            t2(1) = t2(1)*deltaParamFrac;
        case 't2r'
            t2(2) = t2(2)*deltaParamFrac;

    end
     
    save(['temp/', sTissueParameters, '_', sParam, '_deltaPerc_', num2str(deltaParamPerc) '.mat'])
end

