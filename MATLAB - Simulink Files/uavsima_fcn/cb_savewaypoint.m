function handles_out = cb_savewaypoint(handles)
    %% CB_SAVEWAYPOINT description 
    %  save waypoints which defined by into waypoint.mat file
    %  Input:
    %    handles        - data structure
    %  Output: 
    %   handles_out     - data structure
    %  Call:
    %   none
    % Author:
    %   Javen Depari / javensius.sembiring@gmail.com
    % Created:
    %   16.05.2015
    % Revision:
    %   
    %% FUNCTION CONSTRUCTION
    % *** Copy handles to handles_out
    handles_out = handles;
    
    % *** Get number of waypoints
    nwp = str2double(get(handles.edNOP,'String'));
    
    % *** List of number of waypoints
    nwp_list = 3:1:10;
    
    if ismember(nwp,nwp_list)
        
        % *** Storage
        wp_cor(nwp,3) = 0;
        
        for k = 1:nwp
            for j = 2:4
                edName = sprintf('edit%i_%i',k,j);
                wp_cor(k,j-1) = str2double(get(handles.(edName),'String'));
            end
        end
        
        % *** Save selected waypoints to waypoints.mat
        %     Make sure to double each of first data point
        wp_cor_add(nwp+1,3) = 0;
        
        wp_cor_add(1:nwp+1,1) = [wp_cor(1,1); wp_cor(:,1)];
        wp_cor_add(1:nwp+1,2) = [wp_cor(1,2); wp_cor(:,2)];
        wp_cor_add(1:nwp+1,3) = [wp_cor(1,3); wp_cor(:,3)];
        
        % *** Copy back the data to wp_cor
        wp_cor = wp_cor_add;
        wx = wp_cor_add(:, 1);
        wy = wp_cor_add(:, 2);
        wz = wp_cor_add(:, 3);
        save inp_wx.mat wx;
        save inp_wy.mat wy;
        save inp_wz.mat wz;
        save waypoints.mat wp_cor;

        h = waitbar(0,'Saving waypoints ...');
        set(h,'Name','Saving waypoints');
        for k = 1:500
            waitbar(k/500,h);
        end
        pause(1.0);
        close(h);
        
    else
        
        % *** Raise warning
        msgbox('Please select NoP first','Warning','warn');
    end
    
end