function [] = controlLED(device,color)
for ch = color.ch
    if color.value > 4095
        writeline(device,strcat('C', num2str(ch) ,':', num2str(4095)))
    elseif color.value < 0
        writeline(device,strcat('C', num2str(ch) ,':', num2str(0)))
    else
        writeline(device,strcat('C', num2str(ch) ,':', num2str(color.value)))
    end
end
end
