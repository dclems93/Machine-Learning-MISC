function association_rules = generate_association_rules (D, frequent_itemsets, min_confidence)

fprintf(1, '\nCreating candidate assocoation rules...');

ln = length(frequent_itemsets.L);

% convert double level structure into a single level
k = 1;
for i = 1 : ln
    for j = 1 : length(frequent_itemsets.L{i})
        FI{k} = frequent_itemsets.L{i}{j};
        S(k) = frequent_itemsets.S{i}(j);
        k = k + 1;
    end
end

% create candidate rules
ln = length(FI);
k = 1;
for i = 1 : ln
    ps = power_set(FI{i});
    for j = 1 : length(ps)
        % create rules only for non-empty proper subsets
        if ~isempty(ps{j}) & length(ps{j}) ~= length(FI{i})
            candidate_rule{k}.left = ps{j};
            candidate_rule{k}.right = setdiff(FI{i}, ps{j});
            candidate_rule{k}.support = S(i);
            k = k + 1;
        end
    end
end

fprintf(1, ' %d generated', length(candidate_rule));

% calculate confidence
fprintf(1, '\nCalculating confidence for candidate assocoation rules...');
k = 1;
for i = 1 : length(candidate_rule)
    confidence = calculate_confidence(D, candidate_rule{i}.left, candidate_rule{i}.right); % MAKE THIS FUNCTION
    hsupport = calculate_support(D,candidate_rule{i}.right);
    if confidence >= min_confidence
        assosiation_rules{k}.hsupport = hsupport;
        association_rules{k} = candidate_rule{i};
        association_rules{k}.confidence = confidence;
        association_rules{k}.interest = confidence / hsupport;
        k = k + 1;
    end
end
fprintf(1, ' %d generated', length(association_rules));

return