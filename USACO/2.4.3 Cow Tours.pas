{
ID:ToJaRa
LANG:PASCAL
PROG:cowtour
}

Const
  fname='cowtour';
  inf=1<<29;

Var
  n:Longint;
  x,y:Array[1..150] Of Real;
  dis:Array[1..150,1..150] Of Real;
  mdis:Array[1..150] Of Real;
  r1,r2,re,t:Real;

Procedure Openf;inline;
Begin
  Assign(input,fname+'.in');Reset(input);
  Assign(output,fname+'.out');Rewrite(output);
End;

Procedure Closef;inline;
Begin
  Close(input);Close(output);
End;

Procedure Init;inline;
Var
  i,j:Integer;
  ch:char;
Begin
  Readln(n);
  For i:=1 To n Do Readln(x[i],y[i]);
  For i:=1 To n Do Begin
    For j:=1 To n Do Begin
      Read(ch);
      If ch='1' Then dis[i,j]:=Sqrt(Sqr(x[i]-x[j])+sqr(y[i]-y[j]))
      Else dis[i,j]:=inf;
    End;
    readln;
  End;
End;

Procedure work;inline;
Var
  i,j,k:Longint;
Begin
  For k:=1 To n Do
    For i:=1 To n-1 Do
      For j:=i+1 To n Do Begin
        t:=dis[i,k]+dis[k,j];
        If t<dis[i,j] Then Begin
          dis[i,j]:=t;
          dis[j,i]:=t;
        End;
  End;
  For i:=1 To n Do
    For j:=1 To n Do
      If dis[i,j]<>inf Then
        If dis[i,j]>mdis[i] Then mdis[i]:=dis[i,j];
  r1:=inf;
  For i:=1 To n-1 Do
    For j:=i+1 To n Do
      If dis[i,j]=inf Then Begin
        t:=mdis[i]+mdis[j]+sqrt(Sqr(x[i]-x[j])+sqr(y[i]-y[j]));
        If t<r1 Then r1:=t;
      End;
  r2:=0;
  For i:=1 To n Do
    If mdis[i]>r2 Then
      r2:=mdis[i];
  If r1>r2 Then re:=r1 Else re:=r2;
  Writeln(re:0:6);
End;

Begin
  Openf;
  Init;
  work;
  Closef;
End.
