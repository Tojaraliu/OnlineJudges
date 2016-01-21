const
  m:array['A'..'Z'] of shortint=
    (2,2,2,
     3,3,3,
     4,4,4,
     5,5,5,
     6,6,6,
     7,0,7,7,
     8,8,8,
     9,9,9,0);

var
  a:array[0..9999999] of longint;
  s:ansistring;
  max,n:longint;
  f:boolean;

procedure main;
var
  t,i,j:longint;
begin
  readln(n);
  for i:=1 to n do begin
    t:=0;
    readln(s);
    for j:=1 to length(s) do begin
      if not((s[j] in ['0'..'9'])or(s[j] in ['A'..'Z'])) then continue;
      case s[j] of
        '0'..'9':t:=t*10+ord(s[j])-48;
        'A'..'Z':t:=t*10+m[s[j]];
      end;
    end;
    inc(a[t]);
    if t>max then max:=t;
  end;
end;

procedure print;
var
  i:longint;
  s:string;
begin
  f:=true;
  for i:=1 to max do
    if a[i]>=2 then begin
      f:=false;
      while length(s)<7 do s:='0'+s;
      str(i,s);insert('-',s,4);
  end;
end;

begin
  fillchar(a,sizeof(a),0);
  main;
  print;
end.
