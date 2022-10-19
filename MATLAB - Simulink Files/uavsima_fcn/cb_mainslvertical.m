function cb_mainslvertical(handles)
    %% CB_MAINSLVERTICAL description
    %  Rotate axes in vertical axis
    %  Input:
    %    handles        - data structure
    %  Output: 
    %   none
    %  Call:
    %   none
    % Author:
    %   Javen Depari / javensius.sembiring@gmail.com
    % Created:
    %   16.05.2015
    % Revision:
    %   
    %% FUNCTION CONSTRUCTION
    
    az = get(handles.slMainHorizontal,'Value');
    el = get(handles.slMainVertical,'Value');
    set(handles.edVerAngle,'String',num2str(el));
    axes(handles.axMap);
    view(az,el);
    
end