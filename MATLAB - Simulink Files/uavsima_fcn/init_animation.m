function init_animation(handles)
    %% INIT_ANIMATION description
    %  Show animation of patch and line object on the MAIN_UAVSIM.fig
    %  Input:
    %    handles        - data structure
    %  Output: 
    %   none
    %  Call:
    %   set_ruddervator
    %   set_aileron
    % Author:
    %   Javen Depari / javensius.sembiring@gmail.com
    % Created:
    %   16.05.2015
    % Revision:
    %   
    %% FUNCTION CONSTRUCTION
    % *** Show Yaw animation
    pause(1);
    yaw_obj       = handles.topView;
    max_yaw       = 360;
    yaw_to_rotate = -10;
    n_rotate      = abs(max_yaw/yaw_to_rotate);
    for k = 1:n_rotate
        pause(0.1);
        rotate(yaw_obj, [0 0 1], yaw_to_rotate);
        set(handles.edYaw,'String',sprintf('%.2f', k * abs(yaw_to_rotate)));
    end
    set(handles.edYaw,'String', '0.00');
    
    
    % *** Show Pitch animation
    pause(0.5);
    pitch_obj = handles.sideView;
    for k = 1:12
        pause(0.1);
        if k <= 3
            rotate(pitch_obj, [0 0 1], -3);
            pitch_rotate = k * 3;
            set(handles.edPitch,'String', sprintf('%.2f',pitch_rotate));
        end
        if k > 3 && k <= 9
            rotate(pitch_obj, [0 0 1],  3);
            pitch_rotate = pitch_rotate - 3;
            set(handles.edPitch,'String', sprintf('%.2f',pitch_rotate));
        end
        if k > 9
            pitch_rotate = pitch_rotate + 3;
            set(handles.edPitch,'String', sprintf('%.2f',pitch_rotate));
            rotate(pitch_obj, [0 0 1], -3)
        end
    end
    
    % *** Show Roll animation
    pause(0.5);
    roll_obj = handles.backView;
    for k = 1:12
        pause(0.1);
        if k <= 3
            rotate(roll_obj, [0 0 1], -3);
            roll_rotate = k * 3;
            set(handles.edRoll,'String', sprintf('%.2f',roll_rotate));
        end
        if k > 3 && k <= 9
            rotate(roll_obj, [0 0 1],  3);
            roll_rotate = roll_rotate - 3;
            set(handles.edRoll,'String', sprintf('%.2f',roll_rotate));
        end
        if k > 9
            roll_rotate = roll_rotate + 3;
            set(handles.edRoll,'String', sprintf('%.2f',roll_rotate));
            rotate(roll_obj, [0 0 1], -3)
        end
    end
    
    % *** Showing Throttle animation
    pause(0.5);
    for k = 1:10
        thro_obj = bar(handles.axThrottle,0.5,k, 'r','EdgeColor','none');
        set(handles.axThrottle,'Color',[0.624, 0.812, 0.875], ...
            'XLim',[0 1], 'YLim', [0, 10]);
        axis(handles.axThrottle,'off');
        
        % *** Draw a rectangular line on axThrottle -- for throttle indicator
        line([0.1 0.9 0.9 0.1 0.1],[0 0 10 10 0],'LineWidth',1, ...
            'Color','k','LineStyle','-',         ...
            'Parent',handles.axThrottle);
        percent_thro = sprintf('%.0f %%',k * 10);
        set(handles.edThrottle,'String', percent_thro);
        pause(0.05);
    end
    pause(0.5);
    delete(thro_obj);
    set(handles.edThrottle,'String', '00 %');
    
    % *** Showing ruddervator animation
    %     + down, - up
    rightRuddervator = 1.0;
    leftRuddervator  = 1.0;
    set_ruddervator(handles, leftRuddervator, rightRuddervator);
    set(handles.edLeftRuddervator,'String',15);
    set(handles.edRightRuddervator,'String',15);
    pause(0.5);
    
    % *** delete the patch object
    delete(findobj('Type','Line','Color','r','Parent',handles.axRuddervator));
    rightRuddervator = -1.0;
    leftRuddervator  = -1.0;
    set_ruddervator(handles, leftRuddervator, rightRuddervator);
    set(handles.edLeftRuddervator,'String', -15);
    set(handles.edRightRuddervator,'String',-15);
    pause(0.5);
    
    % *** delete the line object
    delete(findobj('Type','Line','Color','r','Parent',handles.axRuddervator));
    rightRuddervator = 0.0;
    leftRuddervator  = 0.0;
    set_ruddervator(handles, leftRuddervator, rightRuddervator);
    set(handles.edLeftRuddervator,'String', 0.0);
    set(handles.edRightRuddervator,'String',0.0);
    
    
    % *** Showing aileron animation
    leftAil  =   1.0;
    rightAil =  -1.0;
    set_aileron(handles, leftAil, rightAil);
    set(handles.edLeftAileron,'String',  10);
    set(handles.edRightAileron,'String',-10);
    pause(0.5);
    delete(findobj('Type','Line','Color','r','Parent',handles.axAileron));
    
    leftAil  =  -1.0;
    rightAil =   1.0;
    set_aileron(handles, leftAil, rightAil);
    set(handles.edLeftAileron,'String', -10);
    set(handles.edRightAileron,'String', 10);
    pause(0.5);
    delete(findobj('Type','Line','Color','r','Parent',handles.axAileron));
    
    leftAil  =  0.0;
    rightAil =  0.0;
    set_aileron(handles, leftAil, rightAil);
    set(handles.edLeftAileron,'String',  0.0);
    set(handles.edRightAileron,'String', 0.0);
    
end