function cb_waypoint(handles)
    %% CB_WAYPOINT description
    %  Set waypoint following controller to ON/OFF
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
     % *** Get tbWaypoint status
    status = get(handles.tb_waypoint,'Value');
    
    if status == 1
        set(handles.tb_waypoint,'String','Waypoint ON','ForegroundColor','r');
        set_param('MAIN_UAVSIM_Simulink/controller/ON_OFF_WF','Value','1');
    else
        set(handles.tb_waypoint,'String','Waypoint OFF','ForegroundColor','k');
        set_param('MAIN_UAVSIM_Simulink/controller/ON_OFF_WF','Value','0');
    end
        
    
end