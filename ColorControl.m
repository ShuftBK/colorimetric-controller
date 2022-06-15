%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Class ColorControl
%  EDIT IN USE
%  EDIT IN USE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

classdef ColorControl
    % Control color
    properties
        device
        
        % color value
        redValue = 0;       
        greenValue = 0;     
        
        % flicker led value
        fredValue1 = 0;
        fredValue2 = 0;
        fgreenValue1 = 0;
        fgreenValue2 = 0;
        
        % color channel
%         redChannel = [1 3 5 7 10 12 14 16];     % Red LED Channel
%         greenChannel =  [2 4 6 8 9 11 13 15];   % Green LED Channel
        redChannel = [1 2 3 5 6 7 10 11 12 14 15 16];     % Red LED Channel
        greenChannel =  [4 8 9 13];   % Green LED Channel
    end
    
    methods
        function obj = ColorControl(device)
            obj.device = device;
        end
        
        function obj = init(obj)
            rstate = obj.redValue;
            gstate = obj.greenValue;
            obj = obj.set(0,0);
            obj = obj.update();
            obj = obj.set(rstate,gstate);
        end
        
        function obj = set(obj,redArg,greenArg)
            % SET
            % set LED Value
            obj.redValue = compareValue(redArg);
            obj.greenValue = compareValue(greenArg);
            
        end
        
        function obj = setflicker(obj,red1, green1, red2, green2)
            % SET
            % set LED Value
            obj.fredValue1 = compareValue(red1);
            obj.fgreenValue1 = compareValue(green1);
            obj.fredValue2 = compareValue(red2);
            obj.fgreenValue2 = compareValue(green2);
        end
        
        function obj = update(varargin)
            % UPDATE
            % update LED
            state = 0;
            if nargin == 2
                obj = varargin{1};
                state = varargin{2};
            else
                obj = varargin{1};
            end
            
            if state == 1
                for ch = obj.redChannel
%                     writeline(obj.device,strcat('C', num2str(ch) ,':', num2str(obj.fredValue1)))
                    writeline(obj.device,strcat('R',':', num2str(obj.fredValue1)))
                end
                for ch = obj.greenChannel
%                     writeline(obj.device,strcat('C', num2str(ch) ,':', num2str(obj.fgreenValue1)))
                    writeline(obj.device,strcat('G',':', num2str(obj.fgreenValue1)))
                end
            elseif state == 2
                for ch = obj.redChannel
%                     writeline(obj.device,strcat('C', num2str(ch) ,':', num2str(obj.fredValue2)))
                    writeline(obj.device,strcat('R',':', num2str(obj.fredValue2)))
                end
                for ch = obj.greenChannel
%                     writeline(obj.device,strcat('C', num2str(ch) ,':', num2str(obj.fgreenValue2)))
                    writeline(obj.device,strcat('G',':', num2str(obj.fgreenValue2)))
                end
            else
                for ch = obj.redChannel
%                     writeline(obj.device,strcat('C', num2str(ch) ,':', num2str(obj.redValue)))
                    writeline(obj.device,strcat('R',':', num2str(obj.redValue)))
                end
                for ch = obj.greenChannel
%                     writeline(obj.device,strcat('C', num2str(ch) ,':', num2str(obj.greenValue)))
                    writeline(obj.device,strcat('G',':', num2str(obj.greenValue)))
                end
            end
        end
        
        function obj = flicker(obj, sec, cycle)
            time = 0;
            flag = 1;
            counter = 1;
            update(obj,1);
            update(obj,1);
            tic
            while 1
                if sec < toc - time
                    time = toc;
                    if flag == 1
                        update(obj,2);
                        update(obj,2);
                        flag = 2;
                    elseif flag == 2
                        update(obj,1);
                        update(obj,1);
                        flag = 1;
                    end
                    counter = counter + 1;
                end
                if cycle < counter
                    break;
                end
            end
            init(obj);
        end
    end
end

function val = compareValue(val)
if val > 4095
    val = 4095;
elseif val < 0
    val = 0;
end
end
