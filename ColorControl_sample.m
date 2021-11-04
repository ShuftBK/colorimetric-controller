port = 'COM7'
device = serialport(port, 115200);
obj = ColorControl(device)
obj = obj.setflicker(5000,5000,0,5000);
obj.flicker(1,10)
