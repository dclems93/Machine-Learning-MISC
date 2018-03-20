function C = generate_candidates (L)

C = {};
k = 1;
for i = 1 : length(L) - 1
    for j = i + 1 : length(L)
        if L{i}(length(L{i})) ~= L{j}(length(L{j})) && length(setdiff(L{i}, L{j})) == 1
            C{k} = union(L{i}, L{j});
            k = k + 1;
        end
    end
end

return
    
