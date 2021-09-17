function main

port = 'COM7'; % set serial port number
device = serialport(port, 115200); % Open device connection

color = initController();       % Initialization Controller
color = controlColor(color);    % Control Color function

while 1
    color = controlValue(color);
    controlLED(device,color);
    fprintf('color : %s , value : %d \n',color.color,color.value);
end
end