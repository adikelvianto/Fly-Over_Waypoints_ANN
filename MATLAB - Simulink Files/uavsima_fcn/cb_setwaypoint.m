function cb_setwaypoint(handles)
    % CB_SETWAYPOINT description:
    %  Set waypoint to be used as uav mission
    %  Input:
    %    handles        - data structure
    %  Output: 
    %   none
    %  Call:
    %   ginput
    % Author:
    %   Javen Depari / javensius.sembiring@gmail.com
    % Created:
    %   16.05.2015
    % Revision:
    %   
    %% FUNCTION CONSTRUCTION
    
    
    % *** Get number of waypoints
    nwp = str2double(get(handles.edNOP,'String'));
    
    % *** List of number of waypoints
    nwp_list = 3:1:10;
    nwp_max  = 10;
    
    if ismember(nwp,nwp_list)
        
        % *** Set other edit box off
        for k = (nwp + 1):nwp_max
            for i = 1:4
                edName = sprintf('edit%i_%i',k,i);
                set(handles.(edName),'Visible','off');
            end
        end
        
        % *** Call set_initsetup() to make sure that map is in 2-D view
        set_initsetup(handles);
        
        % *** Set the waypoint on the axMapSetup
        for k = 1:nwp
            [xcor(k), ycor(k)] = ginput(1);
            
            % *** Set zcor = 1000, user can change them manually in editbox
            zcor = 1000;
            
            % *** Collect waypoint coordinates
            wp_cor = [xcor(k), ycor(k), zcor];
            
            % *** Fill in the edit box with the selected coordinates
            for j = 2:4
                edName = sprintf('edit%i_%i',k,j);
                valCor = sprintf('%0.1f',wp_cor(j-1));
                set(handles.(edName),'String',valCor);
            end
            
            % *** Draw a line on the map
            line(xcor(k),ycor(k),'Marker','x','MarkerSize',10, ...
                                 'LineWidth',2,...
                                 'MarkerEdgeColor','r', ...
                                 'Parent',handles.axMapSetup);
            line(xcor,ycor,'LineStyle','--','Color','Blue', ...
                            'Parent', handles.axMapSetup);
            
        end
        
    else
        msgbox('NoP must be greater than 2 and less than 10!','Warning','warn');
    end
  
end