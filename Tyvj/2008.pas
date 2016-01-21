{
  DP+贪心+单调队列 首先设f[i]表示到了前i个最多能分f[i]组，g[i]表示在取f[i]最大时，最后一组的最小和。则转移条件为g[j]<=s[i]-s[j];对于i而言，我们需要找到在i之前第一个满足g[j]<=s[i]-s[j]的转移给他（因为每个数都是>0的，j尽量接近i，就可以让g尽量小，这样才能更优）。f是满足单调性的，g在f[i]相同的情况下也是单调的，s也是单调的，所以设g2[i]表示g[i]+s[i]，也是单调的。 我们每次需要的是s[i]>=g2[j]的，但由于s是单调递增的，所以我们用一个单调队列维护起来这个g2，因为g2单调递增，而我们要求j尽量接近i，所以对于当前i而言，我们只需要最后一个比s[i]小的g2。所以可以用单调队列把g2维护起来，每次，从队首抛弃元素，直到最后一个比s[i]小的g2，然后将g2加入队尾，当然是要让q保持单调。
  10/16/2012
}

Const
  inf=1<<29;
  
Type
  int=longint;
  
Var
  a,f,g,q,s:Array[0..211111] of int64;
  i,n:int;

Procedure main;
var
  h,t:int;
  tmp:int;
begin
  readln(n);
  h:=0;t:=1;tmp:=0;
  q[0]:=0;
  for i:=1 to n do begin
    read(a[i]);
    s[i]:=s[i-1]+a[i];
    while (h<t)and(g[q[h]]<=s[i]) do begin
      tmp:=q[h];
      inc(h);
    end;
    f[i]:=f[tmp]+1;
    g[i]:=s[i]*2-s[tmp];
    while (h<t)and(g[q[t-1]]>=g[i]) do dec(t);
    q[t]:=i;inc(t);
  end;
  writeln(n-f[n]);
end;

Begin
  main;
end.