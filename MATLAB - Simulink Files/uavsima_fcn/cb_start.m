function cb_start(handles)
    %% CB_START description
    %  Start record data and display on MAIN_UAVSIM
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
    status = get(handles.tbStart,'Value');
    
    delete(findobj('Type','Patch','Parent',handles.axYaw));
    delete(findobj('Type','Patch','Parent',handles.axPitch));
    delete(findobj('Type','Patch','Parent',handles.axRoll));
    
    % *** Load patch data
    faceColor = 'white';
    load uav_patch;
    
    topView  = upatch.topView;
    sideView = upatch.sideView;
    backView = upatch.backView;
    
    % *** Resize topView
    topViewMov = topView * 85;
    
    % Reposition topViewMov closed to (0,0)
    xObYawDataMov = topViewMov(:,1) - 400; % 350 ~ center point
    yObYawDataMov = topViewMov(:,2); % 350 ~ center point
    
    % *** set radius to change to next waypoint (meter)
    wpr = 450;
    
    % *** Load waypoints
    load inp_wx;
    load inp_wy;
    load inp_wz;

    if status == 1
        % *** Change string on tbStart from Start to Stop
        set(handles.tbStart,'String','Stop');
        
        % *** Check and run the simulation
        if strcmp(get_param('MAIN_UAVSIM_Simulink','SimulationStatus'),'stopped')
            set_param('MAIN_UAVSIM_Simulink','SimulationCommand','Start');
        end
        
        % *** Get RuntimeObject from Scope block
        rto = get_param('MAIN_UAVSIM_Simulink/Scope','RuntimeObject');
        
        % *** Looping process initialization
        startnow = 1;
        
        while startnow
            %*** Update every 0.2 sec
            pause(0.20);
            
            % *** Check if user stop the simulation
            status = get(handles.tbStart,'Value');
            if status == 0
                % *** Close from the loop
                startnow = 0;
                % *** Change string on tbStart from Start to Stop
                set(handles.tbStart,'String','Start');
                % *** Check and stop the simulation
                if strcmp(get_param('MAIN_UAVSIM_Simulink','SimulationStatus'),'running')
                    set_param('MAIN_UAVSIM_Simulink','SimulationCommand','Stop');
                end
                
                % *** Set objects to their last state
                % *** Set heading angle
                yaw_obj = patch(topView(:,1),topView(:,2),faceColor,'Parent',handles.axYaw);
                rotate(yaw_obj,[0 0 1],-xpYaw);
                
                % *** Set pitch angle
                pitch_obj = patch(sideView(:,1),sideView(:,2),faceColor,'Parent',handles.axPitch);
                rotate(pitch_obj,[0 0 1],-xpPitch);
                
                % *** Set roll angle
                roll_obj = patch(backView(:,1),backView(:,2),faceColor,'Parent',handles.axRoll);
                rotate(roll_obj,[0 0 1],-xpRoll);
                
                % *** Set ruddervator deflection
                %     + down, - up
                rightRuddervator = xpElv/10;
                leftRuddervator  = xpElv/10;
                set_ruddervator(handles, leftRuddervator, rightRuddervator);
                set(handles.edLeftRuddervator,'String',sprintf('%.2f %s',xpElv,'deg'));
                set(handles.edRightRuddervator,'String',sprintf('%.2f %s',xpElv,'deg'));
                
                
                % *** Set aileron deflection
                leftAil  =  xpAilL/15;
                rightAil =  xpAilR/15;
                set_aileron(handles, leftAil, rightAil);
                set(handles.edLeftAileron,'String',  sprintf('%.2f %s',xpAilL,'deg'));
                set(handles.edRightAileron,'String',sprintf('%.2f %s',xpAilR,'deg'));
                
                
                % *** Place a moving uav with flight path on axMap
                % *** Moving UAV
                hh = hgtransform('Parent',handles.axMap);
                patch(xObYawDataMov,yObYawDataMov,'g','Parent',hh);
                set(hh,'Matrix',makehgtform('translate',...
                    [xpLat xpLon xpAlt],...
                    'zrotate',-xpYaw*pi/180));
                
            else
                
                % *** Getting data from rto -- InputPort
                recvData = get(rto.InputPort(1),'Data');
                sim_time = rto.CurrentTime;
                
                curTime_sec = sim_time;
                
                % *** Set timer GUI -- timer obtained from Simulink runtime
                 hms = sec2hms(curTime_sec);
                 set(handles.edElapsedTime,'String',sprintf('Elapsed Time: %s',hms));
                
                % *** Data received from X-Plane
                xpLat = recvData(4); % X local data
                xpLon = recvData(5); % Y local data
                xpAlt = recvData(6); % Z local data
                xpTAS = recvData(10);
                xpGS = recvData(21);
                xpYaw = recvData(7);
                xpPitch = recvData(8);
                xpRoll = recvData(9);
                xpRud = recvData(17);
                xpElv = recvData(18);
                xpAilL = recvData(19);
                xpAilR = recvData(20);
                xpThro = recvData(14);
                xpThrust = recvData(15);
                xpFF = recvData(16);
                xpWSpd = recvData(22);
                xpWDir = recvData(23);
                
                % *** Data received from Controller
                cwpn = recvData(24);
                cwxn = recvData(25);
                cwyn = recvData(26);
                cwzn = recvData(27);
                cwr  = recvData(28);  % Distance to waypoint
                cyawRef = recvData(29);
                cwf_status = recvData(30);
                cph_status = recvData(31);
                cwl_status = recvData(32);
                
                % *** Update edit box object with current data - from X-Plane
                set(handles.edTAS,'String',sprintf('%.2f',xpTAS));
                set(handles.edGS,'String',sprintf('%.2f',xpGS));
                set(handles.edAlt,'String',sprintf('%.0f',xpAlt));
                set(handles.edYaw','String',sprintf('%.2f',xpYaw));
                set(handles.edPitch','String',sprintf('%.2f',xpPitch));
                set(handles.edRoll','String',sprintf('%.2f',xpRoll));
                set(handles.edThrottle,'String', sprintf('%.0f %%',xpThro * 100));
                set(handles.edThrust,'String', sprintf('%.2f',xpThrust));
                set(handles.edFF,'String',sprintf('%.5f',xpFF));
                set(handles.edWspd,'String',sprintf('%.2f',xpWSpd));
                set(handles.edWdir,'String',sprintf('%.2f',xpWDir));
                
                % *** Update edit box with data from Controller
                set(handles.edWP,'String',sprintf('%.0f',cwpn));
                set(handles.edWPX,'String',sprintf('%.0f',cwxn));
                set(handles.edWPY,'String',sprintf('%.0f',cwyn));
                set(handles.edWPZ,'String',sprintf('%.0f',cwzn));
                set(handles.edHeading,'String',sprintf('%.0f',cyawRef));
                set(handles.edWPDistance,'String',sprintf('%.0f',cwr));
                
                if cwf_status == 1
                    set(handles.edWFStatus,'String','ON','ForegroundColor','r');
                    
                    % *** Plot circle as an indicator to change the waypoint
                    tt = linspace(0, 2*pi,1000); 
                    current_xwaypoint = wx(cwpn + 1);
                    current_ywaypoint = wy(cwpn + 1);
%                     rr = wpr; % distance to change waypoint
                    current_circle_xwaypoint = wpr * cos(tt) + current_xwaypoint;                   
                    current_circle_ywaypoint = wpr * sin(tt) + current_ywaypoint;
                    current_circle = line(current_circle_xwaypoint,current_circle_ywaypoint, ...
                        'Color','Black','LineWidth',1,'LineStyle','-');
                    handles.txRadius2Change.String = sprintf('Radius to change WP:  %0.0f [m]', wpr);

                    % *** Check if distance to WP is less than radius to turn,
                    %     then change the waypoint to the next waypoint.
                    if cwr < wpr && length(wx)-1 > cwpn
                        cwpn = cwpn + 1;
                        set_param('MAIN_UAVSIM_Simulink/controller/NEXT_WP','Value',num2str(cwpn));
                    end

                else
                    set(handles.edWFStatus,'String','OFF','ForegroundColor','k');
                    handles.txRadius2Change.String = sprintf('Radius to change WP: _____[m]');
                end
                
                if cph_status == 1
                    set(handles.edPHStatus,'String','ON','ForegroundColor','r');
                else
                    set(handles.edPHStatus,'String','OFF','ForegroundColor','k');
                end

                if cwl_status == 1
                    set(handles.edWLStatus,'String','ON','ForegroundColor','r');
                else
                    set(handles.edWLStatus,'String','OFF','ForegroundColor','k');
                end
                
                % *** Set heading angle
                yaw_obj = patch(topView(:,1),topView(:,2),faceColor,'Parent',handles.axYaw);
                rotate(yaw_obj,[0 0 1],-xpYaw);
                
                % *** Set pitch angle
                pitch_obj = patch(sideView(:,1),sideView(:,2),faceColor,'Parent',handles.axPitch);
                rotate(pitch_obj,[0 0 1],-xpPitch);
                
                % *** Set roll angle
                roll_obj = patch(backView(:,1),backView(:,2),faceColor,'Parent',handles.axRoll);
                rotate(roll_obj,[0 0 1],-xpRoll);
                
                % *** Throttle setting
                bar(handles.axThrottle,0.5,xpThro * 10, ...
                    'r','EdgeColor','none');
                set(handles.axThrottle,'Color',[0.624, 0.812, 0.875], ...
                    'XLim',[0 1], 'YLim', [0, 10]);
                axis(handles.axThrottle,'off');
                
                % *** Draw a rectangular line on axThrottle
                line([0.1 0.9 0.9 0.1 0.1],[0 0 10 10 0],'LineWidth',1, ...
                    'Color','k','LineStyle','-',                        ...
                    'Parent',handles.axThrottle);
                
                % *** Set ruddervator deflection
                %     + down, - up
                rightRuddervator = xpElv/10;
                leftRuddervator  = xpElv/10;
                set_ruddervator(handles, leftRuddervator, rightRuddervator);
                set(handles.edLeftRuddervator,'String',sprintf('%.2f %s',xpElv,'deg'));
                set(handles.edRightRuddervator,'String',sprintf('%.2f %s',xpElv,'deg'));
                
                
                % *** Set aileron deflection
                leftAil = xpAilL/15;
                rightAil = xpAilR/15;
                set_aileron(handles, leftAil, rightAil);
                set(handles.edLeftAileron,'String',  sprintf('%.2f %s',xpAilL,'deg'));
                set(handles.edRightAileron,'String',sprintf('%.2f %s',xpAilR,'deg'));
                
                
                % *** Place a moving uav with flight path on axMap
                % *** Moving UAV
                hh = hgtransform('Parent',handles.axMap);
                patch(xObYawDataMov,yObYawDataMov,'g','Parent',hh);
                set(hh,'Matrix',makehgtform('translate',...
                    [xpLat xpLon xpAlt],...
                    'zrotate',-xpYaw*pi/180));
                
                % *** Flightpath
                line('XData',xpLat,'YData',xpLon,'ZData',xpAlt,...
                    'Color','r','LineWidth',1,...
                    'Marker','.', ...
                    'MarkerSize',2,'Parent',handles.axMap);
                
                % *** Pause and delete object
                pause(0.1);
                delete(yaw_obj);
                delete(pitch_obj);
                delete(roll_obj);
                delete(findobj('Type','Line','Color','r','Parent',handles.axRuddervator));
                delete(findobj('Type','Line','Color','r','Parent',handles.axAileron));
                delete(hh);
                if cwf_status == 1
                    delete(current_circle);
                end
            end
            
        end
    else
        % *** Change string on tbStart from Start to Stop
        set(handles.tbStart,'String','Start');
        % *** Check and stop the simulation
        if strcmp(get_param('MAIN_UAVSIM_Simulink','SimulationStatus'),'running')
            set_param('MAIN_UAVSIM_Simulink','SimulationCommand','Stop');
        end
    end
end