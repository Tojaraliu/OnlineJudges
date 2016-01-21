{
ID:ToJaRa
PROG:concom
LANG:PASCAL
}

Const
  inp='concom.in';
  outp='concom.out';

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
  n,m:Longint;
  own,vis:Array[0..100] Of Boolean;
  con:Array[0..100,0..100] Of Longint;

Procedure Init;
Var
  i,x,y,z:Longint;
Begin
  Fillchar(con,Sizeof(con),0);
  Readln(n);m:=0;
  For i:=1 To n Do Begin
    Readln(x,y,z);
    If x>m Then m:=x;
    If y>m Then m:=y;
    con[x,y]:=z;
  End;
End;

Procedure Change(x,y:Longint);
Var
  i:Longint;
Begin
  For i:=1 To m Do
    If (x<>i)And(con[x,i]<=50) Then Begin
      Inc(con[x,i],con[y,i]);
      If con[x,i]>50 Then Change(x,i);
    End;
End;

Procedure Main;
Var
  i,j:Longint;
Begin
  For i:=1 To m Do
    For j:=1 To m Do Begin
      If (i<>j)And(con[i,j]>50) Then Change(i,j);
  End;
End;

Procedure Print;
Var
  i,j:Longint;
Begin
  For i:=1 To m Do
    For j:=1 To m Do Begin
      If i=j Then continue;
      If con[i,j]>50 Then Writeln(i,' ',j);
  End;
End;

Begin
  Openf;
  Init;
  Main;
  Print;
  Closef;
End.
