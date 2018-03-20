age = {'0', '1', '2', '3', '4'};
workclass = {'Private', 'Self-emp-not-inc', 'Self-emp-inc', 'Federal-gov', 'Local-gov', 'State-gov', 'Without-pay', 'Never-worked'};
%fnlwgt = REAL;
education = {'Bachelors', 'Some-college', '11th', 'HS-grad', 'Prof-school', 'Assoc-acdm', 'Assoc-voc', '9th', '7th-8th', '12th', 'Masters', '1st-4th', '10th', 'Doctorate', '5th-6th', 'Preschool'};
%education_num REAL
marital_status = {'Married-civ-spouse', 'Divorced', 'Never-married', 'Separated', 'Widowed', 'Married-spouse-absent', 'Married-AF-spouse'};
occupation = {'Tech-support', 'Craft-repair', 'Other-service', 'Sales', 'Exec-managerial', 'Prof-specialty', 'Handlers-cleaners', 'Machine-op-inspct', 'Adm-clerical', 'Farming-fishing', 'Transport-moving', 'Priv-house-serv', 'Protective-serv', 'Armed-Forces'};
relationship = {'Wife', 'Own-child', 'Husband', 'Not-in-family', 'Other-relative', 'Unmarried'};
race = {'White', 'Asian-Pac-Islander', 'Amer-Indian-Eskimo', 'Other', 'Black'};
sex = {'Female', 'Male'};
capitalgain = {'0', '1', '2', '3', '4'};
capitalloss = {'0', '1', '2', '3', '4'};
hoursperweek = {'0', '1', '2', '3', '4'};
native_country = {'United-States', 'Cambodia', 'England', 'Puerto-Rico', 'Canada', 'Germany', 'Outlying-US(Guam-USVI-etc)', 'India', 'Japan', 'Greece', 'South', 'China', 'Cuba', 'Iran', 'Honduras', 'Philippines', 'Italy', 'Poland', 'Jamaica', 'Vietnam', 'Mexico', 'Portugal', 'Ireland', 'France', 'Dominican-Republic', 'Laos', 'Ecuador', 'Taiwan', 'Haiti', 'Columbia', 'Hungary', 'Guatemala', 'Nicaragua', 'Scotland', 'Thailand', 'Yugoslavia', 'El-Salvador', 'Trinadad&Tobago', 'Peru', 'Hong', 'Holand-Netherlands'}
income = {'>50K', '<=50K'};

fid = fopen('census.txt', 'rt');
if (fid == -1)
   error(['The file cannot be opened!']);
end

a = {};
row = 1;
while feof(fid) == 0
    col = 1;
    x = fgetl(fid);
    q = find(x == ',');
    a{row}{col} = x(1 : q(1) - 1);
    col = col + 1;
    for i = 1 : length(q) - 1
        a{row}{col} = x(q(i) + 1 : q(i + 1) - 1);
        col = col + 1;
    end
    a{row}{col} = x(q(length(q)) + 1 : length(x));
    row = row + 1;
end

fclose(fid);

save Census_Raw a