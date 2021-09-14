function color = controlColor(color)

red = [3 5 12 14];      % Red LED Channel
green = [4 6 11 13];    % Green LED Channel

prompt = 'color? > ';    % Prompt Question

while 1
    color.color = input(prompt,'s');
    
    if strcmp('red',color.color)
        color.ch = red;
        break;
    elseif strcmp('green',color.color)
        color.ch = green;
        break;
    end
end
end