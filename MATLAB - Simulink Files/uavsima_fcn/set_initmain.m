function handles_out = set_initmain(handles)
    %% SET_INITMAIN description
    %  set initial state of MAIN_UAVSIM.fig
    %  Input:
    %    handles        - data structure
    %  Output: 
    %   handles_out     - data structure
    %  Call:
    %
    % Author:
    %   Javen Depari / javensius.sembiring@gmail.com
    % Created:
    %   16.05.2015
    % Revision:
    %   
    %% FUNCTION CONSTRUCTION    
    % *** Copy data handles
    handles_out = handles;

    % *** Place an image on header
    image(imread('main_header.png'),'Parent',handles.axMainHeader);
    axis(handles.axMainHeader,'off');
    
    % *** Euler angle axes
    figColor  = [89, 108, 125]/255;  
    axColor   = [240, 240, 240]/255;
    faceColor = 'white';
    axEuler = {'axYaw','axPitch','axRoll'};
    gridColor = [0, 125, 218]/255;
    
    patchName = {'topView','sideView','backView'};
    load uav_patch;
    for k = 1:length(axEuler);
        
        % *** Find if patch object is exist and delete
        delete(findobj('Type','Patch','Parent',handles.(axEuler{k})));
        
        
        % *** Set axes properties
        set(handles.(axEuler{k}),'XTick',1.5:1.5:9,'YTick',1.5:1.5:9,  ...
                                 'XGrid','on','YGrid','on',            ...
                                 'XColor',figColor, 'YColor',figColor, ...
                                 'XLim',[0 10],'YLim',[0 10],          ...
                                 'FontSize',1,'GridColor','w',         ...
                                 'GridLineStyle',':');

        % *** Draw a rectangular line on each axes object
        % line([0 10 10 0 0],[0 0 10 10 0],'LineWidth',0.1,...
        %      'Color','k','LineStyle','-',                ...
        %      'Parent',handles.(axEuler{k}));
         
        % *** Draw a horizontal line on axPitch and axRoll
        if k ~= 1
            line([0.1 9.9],[5 5],'LineWidth',1,...
                 'Color','White','LineStyle','-','Parent',handles.(axEuler{k}));
        end
         
        % *** Place patch object on each axes
        pdata = upatch.(patchName{k});
        handles_out.(patchName{k}) = patch(pdata(:,1),pdata(:,2),faceColor,'Parent',handles.(axEuler{k}));
        
    end
    
    % *** Control surface axes
    axCS = {'axRuddervator','axAileron'};
    for k = 1:length(axCS)
        % *** Set axes properties
        set(handles.(axCS{k}),'XGrid','On','YGrid','On',          ...
                              'XColor',figColor,'YColor',figColor, ...
                              'XLim',[0 10],'YLim',[0 5], ...
                              'GridColor','r','GridLineStyle','-');
    end
    
    % *** Throttle axes object
    set(handles.axThrottle,'XGrid','Off','YGrid','Off',        ...
                           'XColor',axColor, 'YColor',axColor, ...
                           'XLim',[0 1],'YLim',[0 10]);
                       
    % *** Draw a rectangular line on axThrottle -- for throttle indicator
    line([0.1 0.9 0.9 0.1 0.1],[0 0 10 10 0],'LineWidth',1, ...
          'Color','k','LineStyle','-',                      ...
          'Parent',handles.axThrottle);
    
    
    % *** axRuddervator axes object
    set(handles.axRuddervator,'XLim',[0 29.8],'YLim',[0 14],           ...
                              'XGrid','on','YGrid','on',               ...
                              'XTick',2:2:29.8,'YTick',2:2:14,         ...
                              'XColor',figColor,'YColor',figColor,     ...
                              'FontSize',1,'GridColor','k', ...
                              'GridLIneStyle',':');
                          
    ruddervatorLeft_obj  = line([9.40, 13.40],[6.20, 6.70],'LineWidth',1, ...
                               'Color','k','LineStyle','-', 'Parent', handles.axRuddervator);
                           
    ruddervatorRight_obj = line([16.60, 20.60],[6.70, 6.20],'LineWidth',1, ...
                               'Color','k','LineStyle','-', 'Parent', handles.axRuddervator);
    
    bodyRuddervator_obj = rectangle('Position',[13.05, 5.3, 3.5, 3.5],  ...
                                    'Curvature',[1 1],'Parent',handles.axRuddervator);
                                
    set(bodyRuddervator_obj,'FaceColor',faceColor);
    
    % *** Set ruddervator to zero -- put the rudddervator color the same
    %     as axes background color
    rightRuddervator = 0.0;
    leftRuddervator  = 0.0;
    ruddervator_obj = set_ruddervator(handles,leftRuddervator, rightRuddervator);
                     
    % *** axAileron axes object
    set(handles.axAileron,'XLim',[0 29.8],'YLim',[0 14],               ...
                              'XGrid','on','YGrid','on',               ...
                              'XTick',2:2:29.8,'YTick',2:2:14,         ...
                              'XColor',figColor,'YColor',figColor,     ...
                              'FontSize',1,'GridColor','k', ...
                              'GridLineStyle', ':');

    wingAil_obj = line([3.5 26],[7, 7],'LineWidth',1, ...
                       'Color','k','LineStyle','-', 'Parent', handles.axAileron);
    
    bodyAil_obj = rectangle('Position',[13.05, 5.3, 3.5, 3.5], ...
                            'Curvature',[1 1],'Parent',handles.axAileron);
    set(bodyAil_obj,'FaceColor',faceColor);
    
    % *** Set aileron deflection
    leftAil  =  0.0;
    rightAil =  0.0;
    aileron_obj = set_aileron(handles,leftAil,rightAil);
    
    % *** Set axMap properties
    gridColor = [136, 138, 133]/255;
    handles.axMap.XTick = -1500:1500:16500;
    handles.axMap.YTick = -1500:1500:16500;
    handles.axMap.XGrid = 'on';
    handles.axMap.YGrid = 'on';
    handles.axMap.XLim  = [-1500 16500];
    handles.axMap.YLim  = [-1500 16500];
    handles.axMap.XColor= gridColor;
    handles.axMap.YColor= gridColor;
    handles.axMap.FontSize  = 7;
    handles.axMap.GridColor = figColor;
    handles.axMap.Box = 'on';
    xlabel(handles.axMap,'X [m]','Color',gridColor);
    ylabel(handles.axMap,'Y [m]','Color',gridColor);
    
    % *** Set pbMain2View and related slider to off
    set(handles.pbMain2View,'Enable','Off');
    set(handles.pbMain3View,'Enable','On');
    set(handles.slMainHorizontal,'Enable','Off');
    set(handles.slMainVertical,'Enable','Off');
    
    % *** Update data handles with upatch data
    handles_out.upatch          = upatch;
    handles_out.ruddervator_obj = ruddervator_obj;
    handles_out.aileron_obj     = aileron_obj;
    
    % *** This handles structure is used for X-Plane view, default = 0
    handles_out.xpview = 0;
    
    % *** call gen_mainchannel to initiate data used by MAIN_UAVSIM_SIMULINK.mdl
    %     also initial position is loaded from the function below.
    dataType = 1;
    nparam   = 20;
    gen_mainchannel(dataType, nparam);

end

