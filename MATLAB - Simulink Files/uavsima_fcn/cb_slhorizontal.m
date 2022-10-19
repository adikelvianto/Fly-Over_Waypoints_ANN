function cb_slhorizontal(handles)
    %% CB_SLHORIZONTAL description
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
    az = get(handles.slHorizontal,'Value');
    el = get(handles.slVertical,'Value');
    set(handles.edHorAngle,'String',num2str(az));
    axes(handles.axMapSetup);
    view(az,el);
    
end