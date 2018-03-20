function confidence = calculate_confidence (D, itemset_left, itemset_right)

support_all = calculate_support(D, union(itemset_left, itemset_right));
support_left = calculate_support(D, itemset_left);

confidence = support_all / support_left;

return