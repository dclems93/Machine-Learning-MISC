clear
clc

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
native_country = {'United-States', 'Cambodia', 'England', 'Puerto-Rico', 'Canada', 'Germany', 'Outlying-US(Guam-USVI-etc)', 'India', 'Japan', 'Greece', 'South', 'China', 'Cuba', 'Iran', 'Honduras', 'Philippines', 'Italy', 'Poland', 'Jamaica', 'Vietnam', 'Mexico', 'Portugal', 'Ireland', 'France', 'Dominican-Republic', 'Laos', 'Ecuador', 'Taiwan', 'Haiti', 'Columbia', 'Hungary', 'Guatemala', 'Nicaragua', 'Scotland', 'Thailand', 'Yugoslavia', 'El-Salvador', 'Trinadad&Tobago', 'Peru', 'Hong', 'Holand-Netherlands'};
income = {'>50K', '<=50K'};

load Census_raw

total_rows = 48842;
total_cols = 15;

% CHANGE THESE TWO LINES
attribute_name = income;
attribute = 15;

D = zeros(total_rows, length(attribute_name));
for i = 1 : total_rows
    pos = strmatch(a{i}{attribute}, attribute_name, 'exact');
    if ~isempty(pos)
        D(i, pos) = 1;
    end
end

s = 0;
for i = 1 : length(attribute_name)
    s = s + length(find(D(:, i) == 1)) / size(D, 1);
end
s

eval(['save CensusD' num2str(attribute) ' D']);
    
    
% D1 = [];
% for i = [1 2 4 6 7 8 9 10 11 12 13 14 15]
%     eval(['load CensusD' num2str(i)]);
%     D1 = [D1 D];
% end
% D = D1;
% 
% save CensusData D