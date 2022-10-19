function ruddervator_obj = set_ruddervator(handles, leftRuddervator, rightRuddervator)
    %% SET_RUDDERVATOR description
    %  set aileron animation
    %  Input:
    %    handles          - data structure
    %    leftRuddervator  - deflection left ruddervator (ratio)
    %    rightRuddervator - deflection right ruddervator (ratio)
    %  Output: 
    %   ruddervator_obj - ruddervator handles data structure
    %  Call:
    %
    % Author:
    %   Javen Depari / javensius.sembiring@gmail.com
    % Created:
    %   16.05.2015
    % Revision:
    %   
    %% FUNCTION CONSTRUCTION
    % Input ruddervator in ratio 0 to 1, and scale them to 0 to 7
    leftRuddervator  = leftRuddervator  * 7;
    rightRuddervator = rightRuddervator * 7;
    axesColor = [240, 240, 240]/255;

    % *** Set LEFT ruddervator object
    if leftRuddervator == 0
        ruddervatorLeft_obj  = line([10.00, 12.50],[5.4, 5.4],          ...
                                    'LineWidth', 0.1,  ...
                                    'Color',axesColor,'LineStyle','-',  ...
                                    'Parent', handles.axRuddervator);
    else
        if leftRuddervator > 0
            % *** ruddervator deflects down
            ruddervatorLeft_obj  = line([10.00, 12.50],[5.4, 5.4],          ...
                                        'LineWidth', abs(leftRuddervator),  ...
                                        'Color','r','LineStyle','-',        ...
                                        'Parent', handles.axRuddervator);
            
        else
            % *** ruddervator deflect up
            ruddervatorLeft_obj  = line([10.00, 12.50],[7.5, 7.5],  ...
                'LineWidth', abs(leftRuddervator),                  ...
                'Color','r','LineStyle','-',                        ...
                'Parent', handles.axRuddervator);
        end
        
    end
    

    % *** Set RIGHT ruddervator object
    if rightRuddervator == 0
        ruddervatorRight_obj  = line([10.00, 12.50],[5.4, 5.4],         ...
                                    'LineWidth', 0.1,                   ...
                                    'Color',axesColor,'LineStyle','-',  ...
                                    'Parent', handles.axRuddervator);
    else
        
        
        if rightRuddervator > 0
            % *** ruddervator deflects down
            ruddervatorRight_obj = line([17.00, 19.50],[5.4, 5.4],         ...
                                        'LineWidth',abs(rightRuddervator), ...
                                        'Color','r','LineStyle','-',       ...
                                        'Parent', handles.axRuddervator);
        else
            % *** ruddervator deflect up
            ruddervatorRight_obj = line([17.00, 19.50],[7.5, 7.5],         ...
                                        'LineWidth',abs(rightRuddervator), ...
                                        'Color','r','LineStyle','-',       ...
                                        'Parent', handles.axRuddervator);
        end
        
    end
    
    % *** Return ruddervator_obj as function's output
    ruddervator_obj.ruddervatorRight = ruddervatorRight_obj;
    ruddervator_obj.ruddervatorLeft  = ruddervatorLeft_obj;
        
end




                           
