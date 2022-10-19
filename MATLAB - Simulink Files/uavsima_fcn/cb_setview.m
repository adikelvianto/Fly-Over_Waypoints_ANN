function handles_out = cb_setview(handles)
    %% CB_SETVIEW description
    %  Set X-Plane view:
    %      0 -- free, 1 -- chase, 2 -- free, 3 -- spot, 4 -- left
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

    % *** Copy data handles structures
    handles_out = handles;
    
    % *** Get current view
    curview = handles.xpview;
    
    curview = curview + 1;
    
    if curview == 5
        curview = 0;
        % *** Update pushbutton pbView object
        set(handles.pbView,'String',sprintf('Free View'));
        
    else
        % *** Update pushbutton pbView object
        set(handles.pbView,'String',sprintf('View %i',curview));
    end
        
    set_param('MAIN_UAVSIM_Simulink/ToXPlane/inView','Value',sprintf('%i',curview));
   
    % *** Update handles structure
    handles_out.xpview = curview;
        
end