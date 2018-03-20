function [] = print_association_rules (rules, features, filename)

fid = fopen(filename, 'wt');
if (fid == -1)
    error(['File ' filename ' cannot be opened!']);
end

fprintf(1, '\nGenerated Association Rules:\n');
fprintf(fid, '\nGenerated Association Rules:\n');

% sort association rules from most to least complex
for i = 1 : length(rules)
    it_no(i) = length(rules{i}.left) + length(rules{i}.right);
end

[a b] = sort(it_no);
b = b(length(b) : -1 : 1);
rules = rules(b);

% now print them
for i = 1 : length(rules)
    fprintf(1, '\n%s ', features{rules{i}.left(1)});
    fprintf(fid, '\n%s ', features{rules{i}.left(1)});
    for j = 2 : length(rules{i}.left)
        fprintf(1, 'AND %s ', features{rules{i}.left(j)});
        fprintf(fid, 'AND %s ', features{rules{i}.left(j)});
    end
    
    fprintf(1, ' => ');
    fprintf(fid, ' => ');

    fprintf(1, '%s ', features{rules{i}.right(1)});
    fprintf(fid, '%s ', features{rules{i}.right(1)});
    for j = 2 : length(rules{i}.right)
        fprintf(1, 'AND %s ', features{rules{i}.right(j)});
        fprintf(fid, 'AND %s ', features{rules{i}.right(j)});
    end

    fprintf(1, ' [confidence = %.1f%%, interest = %.1f%]', 100 * rules{i}.confidence, rules{i}.interest);
    fprintf(fid, ' [confidence = %.1f%%, interest = %.1f%]', 100 * rules{i}.confidence, rules{i}.interest);
end

fclose('all');

return