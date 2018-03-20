clear
clc

rand('state', 123456);

t1 = clock;

% thresholds used by Apriori to extract rules
min_support = 0.01;
min_confidence = 0.80;
min_rating = 4;
max_level = 2;
min_interest = 7;

fprintf(1, 'Algorithm Apriori\n\n');
fprintf(1, 'Parameters:\n');
fprintf(1, '  Minimum support    : %.1f%%\n', 100 * min_support);
fprintf(1, '  Minimum confidence : %.1f%%\n', 100 * min_confidence);
fprintf(1, '  Maximum level      : %d\n', max_level);

% this line will load a big matrix D (48842-by-121) and feature names (a
% cell array of 121 strings)
load MovieData

feature_names= mn;

% create frequent itemsets of all possible levels
frequent_itemsets = generate_frequent_itemsets(Z, min_support, max_level);
association_rules = interesting_rules(Z, frequent_itemsets, min_interest);
print_association_rules(association_rules, feature_names, 'rules_interest_movie_1.txt');
association_rules = confidence_rules(Z,frequent_itemsets, min_confidence);
print_association_rules(association_rules, feature_names, 'rules_confidence_movie_1.txt');


%change variables
min_support = 0.04;
min_confidence = 0.90;
min_rating = 4;
max_level = 2;
min_interest = 9;


% do it again
frequent_itemsets = generate_frequent_itemsets(Z, min_support, max_level);
association_rules = interesting_rules(Z, frequent_itemsets, min_interest);
print_association_rules(association_rules, feature_names, 'rules_interest_movie_2.txt');
association_rules = confidence_rules(Z,frequent_itemsets, min_confidence);
print_association_rules(association_rules, feature_names, 'rules_confidence_movie_2.txt');

%change variables
min_support = 0.1;
min_confidence = 0.80;
min_rating = 4;
max_level = 2;
min_interest = 7;

% and again
frequent_itemsets = generate_frequent_itemsets(Z, min_support, max_level);
association_rules = interesting_rules(Z, frequent_itemsets, min_interest);
print_association_rules(association_rules, feature_names, 'rules_interest_movie_3.txt');
association_rules = confidence_rules(Z,frequent_itemsets, min_confidence);
print_association_rules(association_rules, feature_names, 'rules_confidence_movie_3.txt');

etime(clock, t1)
