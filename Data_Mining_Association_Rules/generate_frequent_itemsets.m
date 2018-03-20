function frequent_itemsets = generate_frequent_itemsets (D, min_support, max_level)

% any association rule must have at least two elements
if max_level < 2
    max_level = 2;
end

% generates frequent 1-itemsets, based on the dataset D and minimum support
% and their corresponding supports
fprintf(1, '\nGetting frequent itemsets, level = 1... ');
[frequent_itemsets.L{1} frequent_itemsets.S{1}] = generate_frequent_1_itemsets(D, min_support);
fprintf(1, '%d generated', length(frequent_itemsets.L{1}));

% ind shows whether L{1} is empty (0) or non-empty (1)
if length(frequent_itemsets.L{1}) > 0
    ind = 1;
else
    ind = 0;
end

% now, look for 2-itemsets, 3-itemsets... until L{k} is non-empty
level = 2;
while ind == 1
    fprintf(1, '\nGetting frequent itemsets, level = %d... ', level);
    C = generate_candidates(frequent_itemsets.L{level - 1}); % MAKE THIS FUNCTION
    [frequent_itemsets.L{level} frequent_itemsets.S{level}] = filter_candidates(D, C, min_support); % MAKE THIS FUNCTION
    fprintf(1, '%d generated', length(frequent_itemsets.L{level}));
    % L{level} should be a cell array of vectors
    if length(frequent_itemsets.L{level}) > 0 & level < max_level
        ind = 1;
        level = level + 1;
    else
        ind = 0;
    end
end

return
