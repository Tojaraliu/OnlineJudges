{
���Ƚ����п���������ô����i��˵����õ���Ͼ��ǵ�i-1�����ӡ�
��f[i,j]��ʾǰi�����������j˫����С���ѣ����з���
f[i,j]:=min(f[i-1,j],f[i-2,j-1]+(a[i]-a[i-1])^2);
            ����i    ��i��i-1���
}

Const
  inf=1<<29;
  
Type
  int=longint;
  
Var
  a:Array[0..200] of int;
  f:Array[0..201,0..201] of int;
  n,k:int;

Function min(x,y:int):int;
begin
  if x<y then exit(x);exit(y);
end;

Procedure sort(l,r:int);
var
  i,j,mid,t:int;
begin
  i:=l;j:=r;mid:=a[(l+r)>>1];
  repeat
    while a[i]<mid do inc(i);
    while a[j]>mid do dec(j);
    if i<=j then begin
      t:=a[i];a[i]:=a[j];a[j]:=t;
      inc(i);dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

Procedure init;
var
  i,j:int;
begin
  readln(n,k);inc(k,3);
  if (k<<1)>n then begin writeln(-1);halt;end;
  for i:=1 to n do read(a[i]);
  sort(1,n);
end;

Procedure main;
var
  i,j:int;
begin
  fillchar(f,sizeof(f),$3f);
  for i:=0 to n do f[i,0]:=0;
  for i:=2 to n do
    for j:=1 to (i div 2)+1 do
      f[i,j]:=min(f[i-1,j],f[i-2,j-1]+sqr(a[i]-a[i-1]));
  writeln(f[n,k]);
end;

Begin
  init;
  main;
end.