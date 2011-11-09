function [ imgOut ] = normalizeImage( imgIn )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    imgOut =(imgIn-min(min(imgIn)))./(max(max(imgIn))-min(min(imgIn)));

end

