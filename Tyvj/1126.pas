{
��f[i,j]��ʾҪȷ���߶�Ϊi�����һ���j�������õ���С����
����ʼ�տ�����������Ҫ������k���ӵ��ĺ��(1<=k<=i)
1����������ˣ���ô˵������Ӳ����1~k-1֮�䣬��ô���Ǿͻ���Ҫf[k-1,j-1(����һ����)]+1(�����ӵ�)��ȷ��
1�������û�飬��ô˵������Ӳ����k~i֮�䣬���Ǿ���Ҫf[i-k,j]+1��ȷ��Ӳ�ȡ�
�������������£������������еĽϻ����һ���ᷢ����
���Է���Ϊf[i,j]:=min(max(f[k-1,j-1],f[i-k,j])+1);
10/24/2012
}

Const
  inf=1<<29;
  
Type
  int=longint;
  
Var
  f:Array[0..1010,0..1001] of int;
  n,m:int;
  
Function min(x,y:int):int;
begin
  if x<y then exit(x);exit(y);
end;

Function max(x,y:int):int;
begin
  if x>y then exit(x);exit(y);
end;

Procedure main;
var
  i,j,k:int;
begin
  fillchar(f,sizeof(f),0);
  for i:=1 to n do f[1,i]:=1;
  for i:=1 to m do f[i,1]:=i;
  for i:=2 to m do
    for j:=2 to n do
      for k:=1 to i do
        if f[i,j]>0 then f[i,j]:=min(f[i,j],max(f[k-1,j-1],f[i-k,j])+1)
        else f[i,j]:=max(f[k-1,j-1],f[i-1,j])+1;
  writeln(f[m,n]);
end;

Begin
  readln(n,m);
  n:=min(n,10);
  main;
end.