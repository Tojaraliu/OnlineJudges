var
  n,i,max,sum:longint;
  a:array[1..5000]of longint;
function zhi(x:longint):boolean;
var i:longint;
begin
  if x<2 then exit(false);
  for i:=2 to trunc(sqrt(x)) do
    if x mod i=0 then exit(false);
  exit(true);
end;
function maxzhi(x:longint):longint;
var i,j:longint;
begin
  for i:=x downto 1 do
    if x mod i=0 then if zhi(i) then exit(i);
  exit(1);
end;
begin
	//assign(input,'xx');reset(input);
  read(n);
  for i:=1 to n do read(a[i]);
  for i:=1 to n do begin
    if maxzhi(a[i])>max then begin
      max:=maxzhi(a[i]);
      sum:=a[i];
    end;
  end;
  writeln(sum);
  //close(input);
end.