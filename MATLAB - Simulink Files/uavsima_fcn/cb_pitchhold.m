function cb_pitchhold(handles)
    %% CB_PITCHHOLD description
    %  Set pitch hhold controller to ON/OFF
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
     % *** Get tb status
    status = get(handles.tb_pitchhold,'Value');
    
    if status == 1
        set(handles.tb_pitchhold,'String','Pitch Hold ON','ForegroundColor','r');
        set_param('MAIN_UAVSIM_Simulink/controller/ON_OFF_PH','Value','1');
    else
        set(handles.tb_pitchhold,'String','Pitch Hold OFF','ForegroundColor','k');
        set_param('MAIN_UAVSIM_Simulink/controller/ON_OFF_PH','Value','0');
    end
        
    
end