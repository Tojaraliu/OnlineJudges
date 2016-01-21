//tyvj 1978
//给定一些题目和花费时间，有总时间T，要求完成其中若干任务，总话费不超过T，并且使连续不完成的一段的题目数量的最大值最小。
//二分答案，表示这个最大的题目数量，然后验证可行性。用单调队列维护转移，可以把验证答案做到O(n);
//总复杂度O(nlogn);

Const
  inf=1<<29;
  
Type
  int=longint;
  node=record
    f,id:int;
  end;

Var
  a,f:Array[0..100000] of int;
  q:Array[0..100000] of node;
  n,h,time,t:int;
  
Procedure init;
var
  i:int;
begin
  readln(n,time);
  for i:=1 to n do read(a[i]);
end;

Function check(x:int):boolean;
var
  i,j:int;
begin
  fillchar(q,sizeof(q),0);
  fillchar(f,sizeof(f),0);
  h:=1;t:=1;
  q[1].f:=f[0];q[1].id:=0;
  for i:=1 to n+1 do begin
    while true do begin
      if (q[h].id+x+1<i)and(h<>t+1) then inc(h)
      else break;
    end;
    f[i]:=q[h].f+a[i];
    while true do begin
      if (q[t].f<f[i])or(h=t+1) then begin
        inc(t);q[t].f:=f[i];q[t].id:=i;break;
      end;
      dec(t);
    end;
  end;
  if f[n+1]<=time then exit(true) else exit(false);
end;

Procedure main;
var
  l,r,mid:int;
begin
  l:=1;r:=n;
  while l<>r do begin
    mid:=(l+r)>>1;//writeln('binary:',l,' ',r,' ',mid);
    if check(mid) then r:=mid else l:=mid+1;
  end;
  writeln(l);
end;

Begin
  init;
  main;
end.