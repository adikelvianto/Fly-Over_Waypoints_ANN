function gen_mainchannel(daID, nparam)
    %% GEN_MAINCHANNEL description
    %  Generate data channel and type used in MAIN_UAVSIM_SIMULINK.mdl
    %  Input:
    %    daID        - data id: 1 -- single type, 2 -- float type
    %  Output:
    %   none
    %  Call:
    %   none
    % Author:
    %   Javen Depari / javensius.sembiring@gmail.com
    % Created:
    %   23.05.2015
    % Revision:
    %
    %% FUNCTION CONSTRUCTION
    daType = {'single','double'};
    daChan = {1};

    % Storage
    floatType = {};
    doubleType= {};
    dataChannel = {};
    for i = 1:nparam
        if daID == 1
            floatType(i) = daType(1);
            dataType = floatType;
        else
            doubleType(i)= daType(2);
            dataType = doubleType;
        end
        dataChannel(i) = daChan(1);
    end
    
    % *** Set initial position
    latREF = -6.1425582357;
    lonREF = 106.6436692672;
    altREF = 10.7671733489;
    
    % *** Store the data into Matlab's workspace
    assignin('base','dataType',dataType);
    assignin('base','dataChannel',dataChannel);
    assignin('base','latREF',latREF);
    assignin('base','lonREF',lonREF);
    assignin('base','altREF',altREF);
    
end

