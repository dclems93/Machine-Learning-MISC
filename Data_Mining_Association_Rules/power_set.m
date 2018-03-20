function ps = power_set (s)

% function ps = power_set (s)
%
% Function returns the power set of the set s
% s has to be a vector of numbers
% ps is a cell array of vectors
% CAUTION: memory could be an issue

if ~isvector(s)
    error('Input data is not in the proper format');
end

ps_len = 2 ^ length(s);
ln = floor(log2(ps_len));

ps = [];
ps{1} = [];
k = 2;
for i = 1 : ps_len - 1
    x = base_b_expansion(i, 2);
    x = [zeros(1, ln - length(x)) x];
    ps{k} = s(find(x == 1));
    k = k + 1;
end

return