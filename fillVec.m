function [ filledVec ] = fillVec( vec2Fill )
%fillVec Utility function for processing in the V&J style of error calculation

id = find(vec2Fill);
vec2Fill(id(2:end)) = vec2Fill(id(2:end)) - vec2Fill(id(1:end-1));
filledVec = cumsum(vec2Fill);
end

