function cb_wingleveller(handles)
    %% CB_WINGLEVELLER description
    %  Set wing leveller controller to ON/OFF
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
    status = get(handles.tb_wingleveller,'Value');
    if status == 1
        set(handles.tb_wingleveller,'String','Wing Leveller ON','ForegroundColor','r');
        set_param('MAIN_UAVSIM_Simulink/controller/ON_OFF_WL','Value','1');
    else
        set(handles.tb_wingleveller,'String','Wing Leveller OFF','ForegroundColor','k');
        set_param('MAIN_UAVSIM_Simulink/controller/ON_OFF_WL','Value','0');
    end
end