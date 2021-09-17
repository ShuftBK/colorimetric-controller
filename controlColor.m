function color = controlColor(color)

red = [1 3 5 7 10 12 14 16];      % Red LED Channel
green = [2 4 6 8 9 11 13 15];     % Green LED Channel

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