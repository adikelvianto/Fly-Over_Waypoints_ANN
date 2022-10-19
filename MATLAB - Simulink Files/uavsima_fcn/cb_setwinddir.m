function cb_setwinddir(handles)
    %% CB_SETWINDDIR description
    %  Set wind direction by getting data from edit box object
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
    
    % *** Get the wind direction and set through Simulink parameter
    winddir = get(handles.edSetWdir,'String');
    set_param('MAIN_UAVSIM_Simulink/ToXPlane/inWindDir','Value',winddir);
    
end