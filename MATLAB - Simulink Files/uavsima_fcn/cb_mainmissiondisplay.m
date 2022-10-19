function handles_out = cb_mainmissiondisplay(handles)
    %% CB_MISSIONDISPLAY description
    %  Display waypoint on the axes
    %  Input:
    %    handles        - data structure
    %  Output:
    %   handles_out     - data structure
    %  Call:
    %   none
    % Author:
    %   Javen Depari / javensius.sembiring@gmail.com
    % Created:
    %   15.05.2015
    % Revision:
    %
    %% FUNCTION CONSTRUCTION
    
    % *** Check if the toggle button is set to Show WP
    status = get(handles.tbMissionDisplay,'Value');
    
    if status == 1
        set(handles.tbMissionDisplay,'String','Hide WP');
        
        % *** load waypoint data from waypoint.mat file
        load waypoints;
        
        % *** Draw a line on the map - 3D line (first delete current line)
        delete(findobj(handles.axMap,'Type','line','Marker','x'));
        line(wp_cor(2:end,1), wp_cor(2:end,2), wp_cor(2:end,3),'Marker','x', ...
            'MarkerSize',10, ...
            'LineWidth',1,...
            'MarkerEdgeColor','r', ...
            'LineStyle','--',...
            'Parent',handles.axMap);
        
        % *** Force waypoints displayed in 2-D View
        view(handles.axMap,2);
        
        % *** Set mapView to 2
        mapView = 2;
        handles.mapView = mapView;
        
        % *** Set pbMain2View and related slider to off
        set(handles.pbMain2View,'Enable','Off');
        set(handles.pbMain3View,'Enable','On');
        set(handles.slMainHorizontal,'Enable','Off');
        set(handles.slMainVertical,'Enable','Off');
        
        % *** Update handles_out and return as function output
        handles_out = handles;
    else
        set(handles.tbMissionDisplay,'String','Show WP');
        delete(findobj(handles.axMap,'Type','line','Marker','x'));
    end
    
end