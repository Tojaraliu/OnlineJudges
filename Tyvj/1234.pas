Const
  inf=1<<29;

type
  int=longint;
  data=record
    x,y:int;
  end;

var
  head,tail,ans,xx,yy,m,n:int;
  map:array[1..50,1..50] of char;
  q:array[1..30000] of data;
  d:array[1..30000] of int;
  v:array[1..50,1..50] of boolean;

procedure init;
var
  i,j:int;
begin
  readln(m,n);
  ans:=inf;
  head:=1;tail:=1;
  for i:=1 to m do begin
    for j:=1 to n do begin
      read(map[i,j]);
      if map[i,j]='S'  then begin
        q[tail].x:=i;
        q[tail].y:=j;
        v[i,j]:=true;
      end;
    end;
    readln;
  end;
end;

procedure check;
begin
  if d[head]<ans then ans:=d[head];
end;

procedure bfs;
var
  i:int;
begin
  while head<=tail do begin
    xx:=q[head].x;
    yy:=q[head].y;
    for i:=xx+1 to m do begin
      if map[i,yy]='B' then
        if not v[i-1,yy] then begin
          v[i-1,yy]:=true;
          inc(tail);
          q[tail].x:=i-1;
          q[tail].y:=yy;
          d[tail]:=d[head]+1;
          break;
        end
        else break;
      if map[i,yy]='E' then begin
        check;
        break;
      end;
    end;
    for i:=xx-1 downto 1 do begin
      if map[i,yy]='B' then
        if not  v[i+1,yy] then begin
          v[i+1,yy]:=true;
          inc(tail);  
          q[tail].x:=i+1;
          q[tail].y:=yy;
          d[tail]:=d[head]+1;
          break;
        end
        else break;
      if map[i,yy]='E' then begin
        check;
        break;
      end;
    end;
    for i:=yy+1 to n do begin
      if map[xx,i]='B' then
        if not v[xx,i-1] then begin
          v[xx,i-1]:=true;
          inc(tail);
          q[tail].x:=xx;
          q[tail].y:=i-1;
          d[tail]:=d[head]+1;
          break;
        end
        else  break;
      if map[xx,i]='E' then begin
        check;
        break;
      end;
    end;
    for i:=yy-1 downto 1 do begin
      if map[xx,i]='B' then
        if not v[xx,i+1] then begin
          v[xx,i+1]:=true;
          inc(tail);
          q[tail].x:=xx;
          q[tail].y:=i+1;
          d[tail]:=d[head]+1;
          break;
        end
        else break;
        if map[xx,i]='E' then begin
          check;
          break;
        end;
      end;
    inc(head);
  end;
end;

begin
  init;
  bfs;
  if  ans=inf  then  writeln('No')
  else begin
    writeln('Yes');
    writeln(ans);
  end;
end.