function preprocess_data

high_rating = 4;

%fid = fopen(u.user,'rt');
%s = fgetl(fid);

items = 1682;
users = 943;

for i =1 : users
   for j = 1: items
     Z(j,i) = 0;
     j = j+1;
   end
   i = i+1;
end

fid = fopen('u.data','rt');

while feof(fid) < 1 %while not at end of file    
    s = fgetl(fid);
    [token,remain] = strtok(s); % tokenize string s
    user = str2num(token);
    [token,remain] = strtok(remain);%get second token
    item =  str2num(token);
    [token,remain] = strtok(remain);%get third
    rating =  str2num(token);
    if(rating >= high_rating) % if rating is high, change it in the table
       Z(item,user) = 1;
    end
end
fclose(fid);
%do a bit of random sampling to test data validity
%expect 1 from all of these
t=5;
t=t-Z(154,279)
t=t-Z(498,62)
t=t-Z(23,135)
t=t-Z(96,42)
t=t-Z(1147,262)
disp("Expect 0 below this line:");
disp(t);
% these should all be 0
t=t-Z(685,293)
t=t-Z(385,194)
t=t-Z(21,62)
t=t-Z(756,244)
t=t-Z(1336,279)
t=t-Z(203,12)
disp("Expect 0 below this line:");
disp(t);


%get movie names

fid = fopen('u.item','rt');

i = 1;
while feof(fid) < 1 %while not at end of file    
    %while (feof(fid) == 0)
    s = fgetl(fid);
    [token,remain] = strtok(s,'|'); % tokenize string s
    [token,remain] = strtok(remain,'|');%get second token
    moviename =  token;
    mn{i} = moviename;
    i = i + 1;
end
fclose(fid);

%quick sample
disp(mn{437});  % Amityville 1992
disp(mn{660});  %Fried green tomatoes
disp(mn{1682}); %Scream of Stone


save('MovieData.mat','Z','mn');



return