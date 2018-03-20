function support = calculate_support (D, itemset)

support = length(find((sum(D(:, itemset), 2)) == length(itemset))) / size(D, 1);

return