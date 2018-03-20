function a = base_b_expansion (n, b)

% function a = base_b_expansion (n, b)
%
% Converts number n from decimal into base b system
% Example:
%          a = base_b_expansion(10, 2)
%
%          produces vector
%
%          a = [1 0 1 0]
%
% Predrag Radivojac
% Temple University
% November 2003

if n == 0
    a = [0];
    return
end

a = [];
q = n;
while q ~= 0
    a = [mod(q, b) a];
    q = floor(q / b);
end

return