function controller = initController()
controller.color = 'red';
controller.ch = 1:16;
controller.value = 0;
controller.valueG = 0;
controller.valueR = 0;
controller.red = [1 3 5 7 10 12 14 16];      % Red LED Channel
controller.green = [2 4 6 8 9 11 13 15];     % Green LED Channel
end