function cb_pause(handles)
    
    if get(handles.tbPause,'Value') == 1
        set_param('MAIN_UAVSIM_Simulink/ToXPlane/inPause','Value','1');
        pause(2);
        set_param('MAIN_UAVSIM_Simulink','SimulationCommand','pause');
        set(handles.tbPause,'String','Unpause');
    else
        set_param('MAIN_UAVSIM_Simulink','SimulationCommand','continue');
        set_param('MAIN_UAVSIM_Simulink/ToXPlane/inPause','Value','2');
        set(handles.tbPause,'String','Pause');
        
    end
    
end