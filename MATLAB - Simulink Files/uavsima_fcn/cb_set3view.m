function handles_out = cb_set3view(handles)
    %% CB_SET3VIEW description:
    %  Set axes to 3-d view
    %  Input:
    %    handles        - data structure
    %  Output: 
    %   handles_out     - data structure
    %  Call:
    %   none
    % Author:
    %   Javen Depari / javensius.sembiring@gmail.com
    % Created:
    %   16.05.2015
    % Revision:
    %   
    %% FUNCTION CONSTRUCTION
    % *** Set to 3-D View
    view(handles.axMapSetup,3);
    
    % *** Set mapView to 3
    mapView = 3;
    handles.mapView = mapView;
    
    % *** Set tbTwoDim and related slider to off
    set(handles.pbTwoDim,'Enable','On');
    set(handles.pbThreeDim,'Enable','Off');
    set(handles.slHorizontal,'Enable','On');
    set(handles.slVertical,'Enable','On');
    
    % *** Get data back from edit box
    nwp = str2double(get(handles.edNOP,'String'));
    
    % *** List of number of waypoints
    nwp_list = 3:1:10;
    
    if ismember(nwp,nwp_list)
        
        % *** Storage
        wp_cor(nwp,3) = 0;
        
        for k = 1:nwp
            for j = 2:4
                edName = sprintf('edit%i_%i',k,j);
                wp_cor(k,j-1) = str2double(get(handles.(edName),'String'));
            end
        end
        
        % *** Draw a line on the map - 3D line (first delete curren line)
        delete(findobj(handles.axMapSetup,'Type','line'));
        line(wp_cor(:,1), wp_cor(:,2), wp_cor(:,3),'Marker','x', ...
             'MarkerSize',10, ...
             'LineWidth',1,...
             'MarkerEdgeColor','r', ...
             'LineStyle','--',...
             'Parent',handles.axMapSetup);
    else
        
        % *** Raise warning
        msgbox('No Waypoint to Show','Warning','warn');
    end
    
    % *** grid Color
    gridColor = [136, 138, 133]/255;
    
    % *** Set axMapSetup properties
%     handles.axMapSetup.XTick = 1000:1000:10000;
%     handles.axMapSetup.YTick = 1000:1000:10000;
%     handles.axMapSetup.ZTick = 1000:1000:10000;
%     handles.axMapSetup.XGrid = 'on';
%     handles.axMapSetup.YGrid = 'on';
%     handles.axMapSetup.ZGrid = 'on';
%     handles.axMapSetup.XLim  = [0 10000];
%     handles.axMapSetup.YLim  = [0 10000];
%     handles.axMapSetup.ZLim  = [0 10000];
%     handles.axMapSetup.XColor= gridColor;
%     handles.axMapSetup.YColor= gridColor;
%     handles.axMapSetup.ZColor= gridColor;
%     handles.axMapSetup.FontSize = 8;
%     handles.axMapSetup.GridColor = gridColor;
%     xlabel(handles.axMapSetup,'X [m]','Color',gridColor);
%     ylabel(handles.axMapSetup,'Y [m]','Color',gridColor);
%     zlabel(handles.axMapSetup,'Z [m]','Color',gridColor);
%     handles.axMapSetup.Box = 'on';
    
    handles.axMapSetup.XTick = -1500:1500:16500;
    handles.axMapSetup.YTick = -1500:1500:16500;
    handles.axMapSetup.ZTick = 1000:1000:10000;
    handles.axMapSetup.XGrid = 'on';
    handles.axMapSetup.YGrid = 'on';
    handles.axMapSetup.ZGrid = 'on';
    handles.axMapSetup.XLim  = [-1500 16500];
    handles.axMapSetup.YLim  = [-1500 16500];
    handles.axMapSetup.ZLim  = [0 10000];
    handles.axMapSetup.XColor= gridColor;
    handles.axMapSetup.YColor= gridColor;
    handles.axMapSetup.ZColor= gridColor;
    handles.axMapSetup.FontSize = 8;
    handles.axMapSetup.GridColor = gridColor;
    xlabel(handles.axMapSetup,'X [m]','Color',gridColor);
    ylabel(handles.axMapSetup,'Y [m]','Color',gridColor);
    zlabel(handles.axMapSetup,'Z [m]','Color',gridColor);
    handles.axMapSetup.Box = 'on';        

    % *** Update handles_out
    handles_out = handles;
    
end