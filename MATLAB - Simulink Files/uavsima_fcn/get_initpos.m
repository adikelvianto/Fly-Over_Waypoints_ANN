function get_initpos(handles)
    
    if strcmp(get_param('MAIN_UAVSIM_Simulink','SimulationStatus'),'stopped')
        
        delete(findobj('Type','Patch','Parent',handles.axMap));
        
        % *** Start Simulink
        set_param('MAIN_UAVSIM_Simulink','SimulationCommand','Start');
        
        % *** Save selected waypoints to waypoint.mat
        h = waitbar(0,'Initialize UAV position ...');
        set(h,'Name','Saving waypoints');
        for k = 1:500
            waitbar(k/500,h);
        end
        
        pause(2);
        close(h);
        
        % *** Get RuntimeObject from Scope block
        rto = get_param('MAIN_UAVSIM_Simulink/Scope','RuntimeObject');
        
        % *** Getting data from rto -- InputPort
        recvData = get(rto.InputPort(1),'Data');
        
        latREF  = recvData(1);
        lonREF  = recvData(2);
        altREF  = recvData(3);
        
        xLocal  = recvData(4);
        yLocal  = recvData(5);
        zLocal  = recvData(6);
        
        
        % *** Send the data into workspace
        assignin('base','latREF',latREF);
        assignin('base','lonREF',lonREF);
        assignin('base','altREF',altREF);
        
        % *** save the initial position to be sent later to Controller
        save init_pos.mat latREF lonREF altREF;
        
        % *** Place UAV on axMap
        line(0,0,5,'Marker','o','MarkerSize',5, ...
             'Parent',handles.axMap);
        
        % *** Stop the simulation
        set_param('MAIN_UAVSIM_Simulink','SimulationCommand','Stop');
        
    else
        dlgWin = msgbox('Please run the simulation first!');
    end
    
    
end