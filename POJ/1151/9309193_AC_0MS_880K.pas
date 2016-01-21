VAR
  x1,x2,y1,y2:Array[0..101] of double;
  n,time:Longint;
  area:double;

Procedure init;
Var
  i:Longint;
Begin
  fillchar(x1,sizeof(x1),0);fillchar(y1,sizeof(y1),0);
  fillchar(x2,sizeof(x2),0);fillchar(y2,sizeof(y2),0);
  area:=0;
  Readln(n);
  If n=0 Then halt;
  for i:=1 to n do readln(x1[i],y1[i],x2[i],y2[i]);
end;

procedure float(a,b,c,d:double;t:longint);
begin
  while (t<=n)and((a>=x2[t])or(b<=x1[t])or(c>=y2[t])or(d<=y1[t])) do
    inc(t);//floating
  if t>n then begin area:=area+(b-a)*(d-c);exit;end;
  if a<=x1[t] then begin float(a,x1[t],c,d,t+1);a:=x1[t];end;
  if b>=x2[t] then begin float(x2[t],b,c,d,t+1);b:=x2[t];end;
  if c<=y1[t] then begin float(a,b,c,y1[t],t+1);c:=y1[t];end;
  if d>=y2[t] then begin float(a,b,y2[t],d,t+1);d:=y2[t];end;
end;

procedure main;
var
  i:longint;
begin
  for i:=n downto 0 do float(x1[i],x2[i],y1[i],y2[i],i+1);
end;

begin
  time:=0;
  while true do begin
    init;
    main;
    inc(time);
    writeln('Test case #',time);
    writeln('Total explored area: ',area:0:2);
    writeln;
  end;
end.
