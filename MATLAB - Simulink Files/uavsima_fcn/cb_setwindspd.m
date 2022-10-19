function cb_setwindspd(handles)
    %% CB_SETWINDSPD description
    %  Set wind speed by getting data from edit box object
    %  Input:
    %    handles        - data structure
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
    
    % *** Get windspd value from edSetWspd object
    windspd = get(handles.edSetWspd,'String');
    
    % *** Set Simulink parameter
    set_param('MAIN_UAVSIM_Simulink/ToXPlane/inWindSpd','Value',windspd);
    
end