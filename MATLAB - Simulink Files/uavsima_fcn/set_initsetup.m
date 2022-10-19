function handles_out = set_initsetup(handles)
    %% SET_INITSETUP description
    %  set initial state of SETUP_UAVSIM.fig
    %  Input:
    %    handles        - data structure
    %  Output: 
    %   handles_out     - data structure
    %  Call:
    %
    % Author:
    %   Javen Depari / javensius.sembiring@gmail.com
    % Created:
    %   16.05.2015
    % Revision:
    %   
    %% FUNCTION CONSTRUCTION   
    % *** Place an image on header
    image(imread('setup_header.png'),'Parent',handles.axSetupHeader);
    axis(handles.axSetupHeader,'off');
    
    gridColor = [136, 138, 133]/255;
    
    % *** Set axMapSetup properties
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
    
    % *** Always set to 2-D view
    view(handles.axMapSetup,2);
    
    % *** Set mapView to 2
    mapView = 2;
    handles.mapView = mapView;
    
    % *** Set tbThreeDim and related slider to off
    set(handles.pbThreeDim,'Enable','On');
    set(handles.pbTwoDim,'Enable','Off');
    set(handles.slHorizontal,'Enable','Off');
    set(handles.slVertical,'Enable','Off');
    
    % *** Update handles_out
    handles_out = handles;
    
end