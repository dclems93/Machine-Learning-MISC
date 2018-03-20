function [L, S] = generate_frequent_1_itemsets (D, min_support)

% set universe to contain all "features"
Omega = 1 : size(D, 2);

% frequent 1-itemsets (set to an empty set)
L = {};
% supports of the frequent 1-itemsets
S = [];

% generate candidate 1-itemesets
C = {};
k = 1;
for i = 1 : length(Omega)
    C{k} = [Omega(i)];
    k = k + 1;
end

% get frequent 1-itemsets
for i = 1 : length(C)
    support = calculate_support(D, C{i});
    if support >= min_support
        L{length(L) + 1} = C{i};
        S(length(S) + 1) = support;
    end
end

return