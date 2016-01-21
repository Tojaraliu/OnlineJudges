var
 p,n,i,j,mini,minj:longint;
 min:extended;

begin
  readln(p,n);
  min:=10000000;
  for i:=n downto 1 do
   for j:=trunc(i/sqrt(p))-3 to trunc(i/sqrt(p))+3 do
    begin
     if (j<=0)or(j>n) then continue;
     if i=j then continue;
     if (sqrt(p)-(i/j)>0)and(sqrt(p)-(i/j)<=min)  then
      begin
       mini:=i;minj:=j;
       min:=sqrt(p)-(i/j);
      end;
    end;

  write(mini,'/',minj,' ');
  min:=10000000;

  for i:=n downto 1 do
   for j:=trunc(i/sqrt(p))-3 to trunc(i/sqrt(p))+3 do
    if i<>j then
    begin
    if (j<=0)or(j>n) then continue;
     if (sqrt(p)-(i/j)<0)and((i/j)-sqrt(p)<=min)  then
      begin
       mini:=i;minj:=j;
       min:=(i/j)-sqrt(p);
      end;
    end;

  writeln(mini,'/',minj);
end.