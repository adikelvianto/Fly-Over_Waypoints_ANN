function handles_out = cb_setupreset(handles)
    %% CB_SETUPRESET description
    %  Reset SETUP_UAVSIM state to initial condition
    %  Input:
    %    handles        - data structure
    %  Output: 
    %   handles_out     - data structure
    %  Call:
    %   cb_set2view()
    % Author:
    %   Javen Depari / javensius.sembiring@gmail.com
    % Created:
    %   16.05.2015
    % Revision:
    %   
    %% FUNCTION CONSTRUCTION    
    % *** Clear axMapSetup from current waypoint - if any
    delete(findobj(handles.axMapSetup,'Type','line'))

    % *** Set axMapSetup properties
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
    
    % *** Always set to 2-D view -- update handle structure
     handles_out = cb_set2view(handles);
    
    % *** Set waypoint value to zero, and set them to visible
    for k = 1:10
        for j = 1:4
            edName = sprintf('edit%i_%i',k,j);
            if j == 1
                set(handles.(edName),'Visible','on');
            else
                set(handles.(edName),'Visible','on','String','0');
            end
        end
    end
    
    % *** Set NoP to zero
    set(handles.edNOP,'String','0');
end