{
���������Ѿ��ҵ��������a����ô��������������
y=x*a+b
�����е�b����ȣ�x�������ǹ��ĵġ�
������ʽ���������y1-y2=(x1-x2)*a��Ҫ������a��ֻҪ��y1-y2�����Լ������
����û�б�Ҫ����������֮���GCD��ֻҪ����������ȥ��С���Ǹ�a[i]�����Լ�����ɡ�
TyvjAC200
}

Const
  inf=1<<29;
  
Type
  int=longint;

Var
  n,ans:int;
  a:Array[0..200] of int;

Function gcd(x,y:int):int;
begin
  if x=0 then exit(y);
  if y=0 then exit(x);
  exit(gcd(y,x mod y));
end;

Procedure init;
Var
  i,minj,min,t:int;
begin
  readln(n);
  for i:=1 to n do read(a[i]);
  minj:=1;min:=a[1];
  for i:=2 to n do
    if a[i]<min then begin
      min:=a[i];minj:=i;
    end;
  t:=a[minj];a[minj]:=a[n];a[n]:=t;
end;

Procedure main;
var
  i:int;
begin
  for i:=1 to n-1 do dec(a[i],a[n]);
  dec(n);
  ans:=a[1];
  for i:=2 to n do ans:=gcd(ans,a[i]);
  writeln(ans);
end;

Begin
  init;
  main;
end.