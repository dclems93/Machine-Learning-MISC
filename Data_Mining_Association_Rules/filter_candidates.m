function [L, S] = filter_candidates (D, C, min_support)

% frequent itemsets
L = {};
% supports of the frequent itemsets
S = [];

% get frequent itemsets
for i = 1 : length(C)
    support = calculate_support(D, C{i});
    if support >= min_support
        L{length(L) + 1} = C{i};
        S(length(S) + 1) = support;
    end
end

return

