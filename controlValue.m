function color = controlValue(color)

prompt = 'LED color value? > ';    % Prompt Question

while 1
    value = input(prompt,'s');
    if isempty(value)
        fprintf('no color.value input.\n')
        continue;
    end
    
    if strcmp('color',value)
        color = controlColor(color);
        continue;
    end
    
    value = str2double(value);
    
    if value > 4095
        fprintf('over 4095\n')
        color.value = 4095;
        break;
    elseif value < 0
        fprintf('under 0\n')
        color.value = 0;
        break;
    end
    
    color.value = value;
    
    break;
end
end