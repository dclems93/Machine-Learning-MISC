clear
clc

rand('state', 123456);

t1 = clock;

% thresholds used by Apriori to extract rules
min_support = 0.01;
min_confidence = 0.80;
max_level = 3;
min_interest = 6; %set a high interest to get higher results for comparison

fprintf(1, 'Algorithm Apriori\n\n');
fprintf(1, 'Parameters:\n');
fprintf(1, '  Minimum support    : %.1f%%\n', 100 * min_support);
fprintf(1, '  Minimum confidence : %.1f%%\n', 100 * min_confidence);
fprintf(1, '  Maximum level      : %d\n', max_level);

% this line will load a big matrix D (48842-by-121) and feature names (a
% cell array of 121 strings)
load CensusData


% create frequent itemsets of all possible levels
frequent_itemsets = generate_frequent_itemsets(D, min_support, max_level);

% create association rules and calculate confidence levels and interest,
% print on their own files
association_rules= interesting_rules(D, frequent_itemsets, min_interest);
print_association_rules(association_rules_interest, feature_names, 'rules_interest.txt');
association_rules= confidence_rules(D,frequent_itemsets, min_confidence);
print_association_rules(association_rules_confidence, feature_names, 'rules_confidence.txt');




etime(clock, t1)
