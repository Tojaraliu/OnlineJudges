var
  n,m,c,time:longint;
  a:array[0..100001,0..201] of longint;
  v:array[0..100001] of boolean;
  b,d:array[0..200001] of longint;

procedure init;
var
  i,j,k:longint;
begin
  readln(n,m,c);readln(time);
  for i:=1 to m do begin
    readln(j,k);
    inc(a[j,0]);a[j,a[j,0]]:=k;
    inc(a[k,0]);a[k,a[k,0]]:=j;
  end;
end;

procedure work;
var
  head,tail,max,i:longint;
begin
  max:=0;fillchar(v,sizeof(v),false);
  head:=1;tail:=1;b[c]:=0;d[1]:=c;v[c]:=true;
  while head<=tail do begin
    for i:=1 to a[d[head],0] do
      if not v[a[d[head],i]] then begin
        inc(tail);
        d[tail]:=a[d[head],i];
        v[d[tail]]:=true;
        b[d[tail]]:=b[d[head]]+1;
        if b[d[tail]]>max then max:=b[d[tail]];
      end;
    inc(head);
  end;
  writeln(max+time+1);
end;

Begin
  init;
  work;
End.