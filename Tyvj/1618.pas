//Nothing Is More Fucking Than Going Back To School!
//No Test Is More Fucking Than The Test Tonight!
type
  magic=record
    s,e:longint;
    c:qword;
  end;

var
  n,m,tot,st,ed,len:longint;
  sum:array[0..2000001] of qword;
  q:array[0..2001] of magic;
  sumt:qword;

procedure init;
var
  i,t:longint;
begin
  for i:=0 to n-1 do begin
    read(sum[i]);
    inc(sum[i],sum[i-1]);
  end;
  readln;
end;

procedure op;
var
  i:longint;
begin
  if st=0 then sumt:=sum[ed] else sumt:=sum[ed]-sum[st-1];
  for i:=1 to tot do begin
    if (q[i].s<=st)and(ed<=q[i].e) then len:=ed-st+1
    else if (st<=q[i].s)and(ed<=q[i].e) then len:=ed-q[i].s+1
    else if (q[i].s<=st)and(q[i].e<=ed) then len:=q[i].e-st+1
    else if (st<=q[i].s)and(q[i].e<=ed) then len:=q[i].e-q[i].s+1
    else continue;
    inc(sumt,len*q[i].c);
  end;
  writeln(sumt);
end;

procedure main;
var
  i,j:longint;
  ch:char;
begin
  tot:=0;
  for i:=1 to m do begin
    sumt:=0;
    read(ch);
    case ch of
      'Q':begin
        readln(st,ed);op;
      end;
      else begin
        inc(tot);
        readln(q[tot].s,q[tot].e,q[tot].c);
      end;
    end;
  end;
end;

begin
  readln(n,m);
  init;
  main;
end.
