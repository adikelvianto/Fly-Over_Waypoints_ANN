function cb_mainslhorizontal(handles)
    %% CB_MAINSLHORIZONTAL description
    %  Rotate axes in horizontal axis
    %  Input:
    %    handles        - data structure
    %  Output: 
    %   none
    %  Call:
    %   none
    % Author:
    %   Javen Depari / javensius.sembiring@gmail.com
    % Created:
    %   15.05.2015
    % Revision:
    %   
    %% FUNCTION CONSTRUCTION
    az = get(handles.slMainHorizontal,'Value');
    el = get(handles.slMainVertical,'Value');
    set(handles.edHorAngle,'String',num2str(az));
    axes(handles.axMap);
    view(az,el);
    
end