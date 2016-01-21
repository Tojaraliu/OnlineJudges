{
ID:ToJaRa
PROG:packrec
LANG:PASCAL
}

var 
  i,j,s,s0,s1,s2,s3,s4:longint;
  x1,x2,x3,x4,y1,y2,y3,y4:longint;
  a,b,position:array[1..4]of longint;
  l:array[1..5,1..2]of longint;
  change:array[1..4] of boolean;
  matrix:array[1..200,1..200]of boolean;
  
procedure dfs(n:longint);
begin
  inc(position[n]);
  change[n]:=true;
  if (position[n]=2)and(n<4) then dfs(n+1);
  position[n]:=position[n] mod 2;
end;

procedure swap(var a,b:longint);
var 
  t:longint;
begin 
  t:=a; a:=b; b:=t;
end;

function max(a,b:longint):longint;
begin 
  if a>b then exit(a); exit(b); 
end;

begin
  assign(input,'packrec.in'); reset(input);
  assign(output,'packrec.out'); rewrite(output);
  for i:=1 to 4 do read(a[i],b[i]);
  s0:=maxint;
  for i:=0 to 15 do begin
    fillchar(change,sizeof(change),0);
    dfs(1);
    for j:=1 to 4 do if change[j] then swap(a[j],b[j]);
    for s1:=1 to 4 do 
      for s2:=1 to 4 do
        if s2<>s1 then for s3:=1 to 4 do
          if (s3<>s1)and(s3<>s2)then begin
            s4:=10-s1-s2-s3;
            x1:=a[s1]; y1:=b[s1];
            x2:=a[s2]; y2:=b[s2];
            x3:=a[s3]; y3:=b[s3];
            x4:=a[s4]; y4:=b[s4];
            l[1,1]:=x1+x2+x3+x4; l[1,2]:=max(y1,max(y2,max(y3,y4)));
            l[2,1]:=max(x1,x2+x3+x4); l[2,2]:=y1+max(y2,max(y3,y4));
            l[3,1]:=max(x1+x2,x3)+x4; l[3,2]:=max(y4,max(y1,y2)+y3);
            l[4,1]:=max(x2,x3)+x1+x4; l[4,2]:=max(y1,max(y2+y3,y4));
            l[5,1]:=max(x1+x2,max(x3,x4)); l[5,2]:=max(y1+y3,y2+y4);
            if y1<y2 then l[5,1]:=max(l[5,1],x2+x3);
            if y1>y2 then l[5,1]:=max(l[5,1],x1+x4);
            if y1+y3>y2 then l[5,1]:=max(l[5,1],x3+x4);
            for j:=1 to 5 do begin
              if l[j,1]>l[j,2] then swap(l[j,1],l[j,2]);
              s:=l[j,1]*l[j,2];
              if s<s0 then begin
                fillchar(matrix,sizeof(matrix),0);
                s0:=s;
              end;
              if s=s0 then matrix[l[j,1],l[j,2]]:=true;
            end;
          end;
  end;
  writeln(s0);
  for i:=1 to 200 do for j:=i to 200 do
    if matrix[i,j] then writeln(i,' ',j);
  close(input);close(output);
end.