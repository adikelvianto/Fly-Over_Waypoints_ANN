function handles_out = cb_mainset2view(handles)
    %% CB_MAINSET2VIEW description
    %  Set axes to 2-d view
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
    % *** Set mapView to 2 and update handles structure
    mapView = 2;
    handles.mapView = mapView;
    
    % *** Set to 2-D View
    view(handles.axMap,mapView);
       
    % *** Set pbMain2View and related slider to off   
    set(handles.pbMain2View,'Enable','Off');
    set(handles.pbMain3View,'Enable','On');
    set(handles.slMainHorizontal,'Enable','Off');
    set(handles.slMainVertical,'Enable','Off');
    
    % *** Update handles_out
    handles_out = handles;
    
 
end