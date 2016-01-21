{
ID:ToJaRa
PROG:maze1
LANG:PASCAL
}

Const
  inp='maze1.in';
  outp='maze1.out';
  inf=1<<29;

Procedure Openf;
Begin
  Assign(input,inp);Reset(input);
  Assign(output,outp);Rewrite(output);
End;

Procedure Closef;
Begin
  Close(input);
  Close(output);
End;

Var
  a:Array[0..202,0..150] Of char;
  f:Array[0..202,0..150] Of Longint;
  w,h,ht,wt,ans:Longint;

Procedure Init;
Var
  i,j:Longint;
  ch:char;
Begin
  Readln(w,h);ht:=(h<<1)+1;wt:=(w<<1)+1;
  For i:=1 To ht Do Begin
    For j:=1 To wt Do Read(a[i,j]);
    readln;
  End;
  For i:=1 To h Do For j:=1 To w Do f[i,j]:=inf;
End;

Procedure Bfs(x,y,k:Longint);
Begin
  If k<f[x,y] Then f[x,y]:=k Else exit;
  If (x>1)And(a[x*2-1,y*2]=' ') Then Bfs(x-1,y,k+1);
  If (y>1)And(a[x*2,y*2-1]=' ') Then Bfs(x,y-1,k+1);
  If (x<h)And(a[x*2+1,y*2]=' ') Then Bfs(x+1,y,k+1);
  If (y<w)And(a[x*2,y*2+1]=' ') Then Bfs(x,y+1,k+1);
End;

Procedure Main;
Var
  i,j:Longint;
Begin
  For i:=1 To h Do Begin
    If a[i<<1,1]=' ' Then Bfs(i,1,1);
    If a[i<<1,wt]=' ' Then Bfs(i,w,1);
  End;
  For i:=1 To w Do Begin
    If a[1,i<<1]=' ' Then Bfs(1,i,1);
    If a[ht,i<<1]=' ' Then Bfs(h,i,1);
  End;
  ans:=-inf;
  For i:=1 To h Do
    For j:=1 To w Do
      If f[i,j]>ans Then ans:=f[i,j];
  Writeln(ans);
End;

Begin
  Openf;
  Init;
  Main;
  Closef;
End.
