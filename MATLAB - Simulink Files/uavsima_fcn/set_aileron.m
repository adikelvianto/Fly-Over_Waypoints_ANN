function ail_obj = set_aileron(handles,leftAil, rightAil)
    %% SET_AILERON description
    %  set aileron animation
    %  Input:
    %    handles        - data structure
    %  Output: 
    %   ail_obj         - aileron handles data structure
    %  Call:
    %
    % Author:
    %   Javen Depari / javensius.sembiring@gmail.com
    % Created:
    %   16.05.2015
    % Revision:
    %   
    %% FUNCTION CONSTRUCTION
    % *** Input aileron in ratio 0 to 1, and scale them to 0 to 7
    leftAil  = leftAil  * 7;
    rightAil = rightAil * 7;
    axesColor = [240, 240, 240]/255;
    
    % *** Set LEFT aileron object
    if leftAil == 0
        ailLeft_obj = line([4.0, 8.5], [6.0, 6.0], 'LineWidth',0.1, ...
                            'Color',axesColor,'LineStyle','-',       ...
                            'Parent',handles.axAileron);
    else
        if leftAil > 0
            % *** aileron deflects down ( + deflection )
            ailLeft_obj = line([4.0, 8.5], [6.0, 6.0], 'LineWidth',abs(leftAil), ...
                                'Color','r','LineStyle','-','Parent',handles.axAileron);
        else
            % Aileron deflect up
            ailLeft_obj = line([4.0, 8.5], [8.0, 8.0], 'LineWidth',abs(leftAil), ...
                                'Color','r','LineStyle','-','Parent',handles.axAileron);
        end
    end
    
    % *** Set RIGHT aileron object
    if rightAil == 0
        ailRight_obj = line([4.0, 8.5], [6.0, 6.0], 'LineWidth',0.1, ...
                            'Color',axesColor,'LineStyle','-',       ...
                            'Parent',handles.axAileron);
    else
        if rightAil > 0
            % *** aileron deflects down ( + deflection )
            ailRight_obj = line([21.0, 25.5], [6.0, 6.0], 'LineWidth',abs(rightAil), ...
                                'Color','r','LineStyle','-','Parent',handles.axAileron);
        else
            % Aileron deflect up
            ailRight_obj = line([21.0, 25.5], [8.0, 8.0], 'LineWidth',abs(rightAil), ...
                                'Color','r','LineStyle','-','Parent',handles.axAileron);
        end
    end
    
    % *** Return ail_obj as function's output
    ail_obj.ailRight = ailRight_obj;
    ail_obj.ailLeft  = ailLeft_obj;
        
end
