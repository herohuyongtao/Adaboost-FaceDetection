function [ filledVec ] = fillVec( vec2Fill )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
id = find(vec2Fill);
vec2Fill(id(2:end)) = vec2Fill(id(2:end)) - vec2Fill(id(1:end-1));
filledVec = cumsum(vec2Fill);
end

