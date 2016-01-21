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
  a:array[0..100001] of longint;
  b:array[0..10000000] of longint;
  s:ansistring;
  max,n,mt:longint;
  f:boolean;

procedure main;
var
  t,i,j:longint;
begin
  readln(n);mt:=0;
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
    inc(mt);a[mt]:=t;
  end;
end;

procedure print;
var
  i:longint;
  s:ansistring;
begin
  fillchar(b,sizeof(b),0);
  for i:=1 to mt do inc(b[a[i]]);
  f:=true;
  for i:=0 to 10000000 do
    if b[i]>=2 then begin
      f:=false;
      str(i,s);while length(s)<7 do s:='0'+s;
      insert('-',s,4);
      writeln(s,' ',b[i]);
  end;
  if f then writeln('No duplicates.');
end;

begin
  main;
  print;
end.
