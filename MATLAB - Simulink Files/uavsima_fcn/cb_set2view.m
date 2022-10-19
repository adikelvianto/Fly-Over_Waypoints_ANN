function handles_out = cb_set2view(handles)
    %% CB_SET2VIEW description:
    %  Set axes to 2-d view
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
    % *** Set to 2-D View
    view(handles.axMapSetup,2);
    
    % *** Set mapView to 2
    mapView = 2;
    handles.mapView = mapView;
    
    % *** Set tbTwoDim and related slider to off
    set(handles.pbTwoDim,'Enable','Off');
    set(handles.pbThreeDim,'Enable','On');
    set(handles.slHorizontal,'Enable','Off');
    set(handles.slVertical,'Enable','Off');
    
    % *** Update handles_out
    handles_out = handles;
end