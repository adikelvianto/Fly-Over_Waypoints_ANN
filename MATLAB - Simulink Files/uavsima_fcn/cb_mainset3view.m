function handles_out = cb_mainset3view(handles)
    %% CB_MAINSET3VIEW description
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
    %   15.05.2015
    % Revision:
    %   
    %% FUNCTION CONSTRUCTION
    % *** Set mapView to 3 and update handles data
    mapView = 3;
    handles.mapView = mapView;
    
    % *** Set to 3-D View
    view(handles.axMap,mapView);
    
    % *** grid Color
    gridColor = [136, 138, 133]/255;
    
    % *** Set pbMain3View and related slider to off   
    set(handles.pbMain2View,'Enable','On');
    set(handles.pbMain3View,'Enable','Off');
    set(handles.slMainHorizontal,'Enable','On');
    set(handles.slMainVertical,'Enable','On');
    
    % *** Figure background color
    figColor  = [89, 108, 125]/255;
        
    % *** Set axMap properties
    handles.axMap.XTick = -1500:1500:16500;
    handles.axMap.YTick = -1500:1500:16500;
    handles.axMap.ZTick = 1000:1000:10000;
    handles.axMap.XGrid = 'on';
    handles.axMap.YGrid = 'on';
    handles.axMap.ZGrid = 'on';
    handles.axMap.XLim  = [-1500 16500];
    handles.axMap.YLim  = [-1500 16500];
    handles.axMap.ZLim  = [0 10000];
    handles.axMap.XColor= gridColor;
    handles.axMap.YColor= gridColor;
    handles.axMap.ZColor= gridColor;
    handles.axMap.FontSize = 8;
    handles.axMap.GridColor = figColor;
    xlabel(handles.axMap,'X [m]','Color',gridColor);
    ylabel(handles.axMap,'Y [m]','Color',gridColor);
    zlabel(handles.axMap,'Z [m]','Color',gridColor);
    handles.axMap.Box = 'on';
    
    % *** Update handles_out
    handles_out = handles;
    
end