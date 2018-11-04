function [leftTool, rightTool, camera] = readfile(filename)

load(strcat('.\data\',filename));
leftTool = data{2,2}(:,[1 2 3]);
rightTool = data{5,2}(:,[1 2 3]);
camera = data{8,2}(:,[1 2 3]);