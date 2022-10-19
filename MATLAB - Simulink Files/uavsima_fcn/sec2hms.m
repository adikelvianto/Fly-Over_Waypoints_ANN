function hms = sec2hms(t)
    %% SEC2HMS description
    %  Convert sec into hh:mm:ss format
    %  Input:
    %    t              - time in sec
    %  Output: 
    %   hms             - time in hour:min:sec format
    %  Call:
    %   none
    % Author:
    %   Javen Depari / javensius.sembiring@gmail.com
    % Created:
    %   26.05.2015
    % Revision:
    %   
    %% FUNCTION CONSTRUCTION
    hours = floor(t / 3600);
    t = t - hours * 3600;
    mins = floor(t / 60);
    secs = t - mins * 60;
    hms = sprintf('%02d:%02d:%04.1f', hours, mins, secs);
end

