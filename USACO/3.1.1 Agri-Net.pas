{
ID:ToJaRa
LANG:PASCAL
PROG:agrinet
}

Const
  fname='agrinet';

Var
  edge,n:Longint;
  e,x,y:Array[0..20000] Of Longint;
  fa:Array[0..200] Of Longint;

Procedure Openf;
Begin
  Assign(input,fname+'.in');Reset(input);
  Assign(output,fname+'.out');Rewrite(output);
End;

Procedure Closef;
Begin
  Close(input);Close(output);
End;

Procedure Swap(Var x,y:Longint);
Var
	t:Longint;
Begin
	t:=x;x:=y;y:=t;
End;

Procedure Qsort(l,r:Longint);
Var
	i,j,mid,t:Longint;
Begin
	i:=l;j:=r;mid:=e[(l+r) Div 2];
	Repeat
		While e[i]<mid Do Inc(i);
		While e[j]>mid Do Dec(j);
		If i<=j Then
		Begin
			Swap(e[i],e[j]);
      Swap(x[i],x[j]);
      Swap(y[i],y[j]);
			Inc(i);Dec(j);
		End;
	Until i>j;
	If i<r Then Qsort(i,r);
	If j>l Then Qsort(l,j);
End;

Function Getfather(x:Longint):Longint;
Begin
  If fa[x]=x Then Exit(x);
  fa[x]:=Getfather(fa[x]);
  Exit(fa[x]);
End;

Procedure Union(x,y:Longint);
Var
  fx,fy:Longint;
Begin
  fx:=Getfather(x);fy:=Getfather(y);
  If fx<>fy Then fa[fx]:=fy;
End;

Procedure Init;
Var
  i,j,k:Longint;
Begin
  Read(n);
  For i:=1 To n Do fa[i]:=i;
  For i:=1 To n Do
    For j:=1 To n Do Begin
      Read(k);
      If i<j Then Begin
        Inc(edge);
        e[edge] := k;
        x[edge] := i;
        y[edge] := j;
      End;
    End;
  Qsort(1,edge);
End;

Procedure work;
Var
  i,k,ans:Longint;
Begin
  i:=0; k:=0;
  Repeat
    Inc(i);
    If Getfather(x[i])<>Getfather(y[i]) Then Begin
      Inc(ans,e[i]);
      Union(x[i],y[i]);
      Inc(k);
    End;
  Until k=n-1;

  Writeln(ans);
End;

Begin
  Openf;
  Init;
  work;
  Closef;
End.
