{
��f[i,j]��ʾ��i,jΪ���½ǣ�����̫��ͼ�ı߳���
���a[i,j-1]��1����ôf[i,j]����1��
ת�Ƶ�������(f[i-1,j]=f[i,j-1])and(a[i-f[i-1,j],j-f[i,j-1]-1]=1)
��һ���֣���ʾ����������ܼ̳������Ϸ����󷽡����ڴ�ʱ���Ѿ����Լ̳������Ϸ����󷽣����ʱ����ȷ�����������Ͻ��Ǹ��㣬����������1����ô�Ϳ���ȷ�������Լ̳��ˡ�f[i,j]=f[i-1,j]+1
10/25/2012
}

Const
  inf=1<<29;

Type
  int=longint;

Var
  f,a:Array[0..1011,0..1011] of int;
  n,m,ans,i,j,t:int;

Function max(x,y:int):int;
begin
  if x>y then exit(x);exit(y);
end;

Begin
  readln(n,m);
  for i:=1 to n do
    for j:=1 to m do read(a[i,j]);
  ans:=0;
  for i:=1 to n do
    for j:=1 to m do begin
      if a[i,j]=1 then begin f[i,j]:=0;continue;end;
      if (f[i-1,j]=f[i,j-1])and(a[i-f[i-1,j],j-f[i,j-1]-1]=1) then f[i,j]:=f[i-1,j]+1;
      if (a[i,j-1]=1) then f[i,j]:=1;
      ans:=max(ans,f[i,j]);
    end;
  writeln(ans);
end.
