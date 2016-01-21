{
ID:ToJaRa
PROG:money
LANG:PASCAL
}

Const
  inp='money.in';
  outp='money.out';

Procedure openf;
Begin
  Assign(input,inp);Reset(input);
  Assign(output,outp);Rewrite(output);
End;

Procedure closef;
Begin
  Close(input);
  Close(output);
End;

Var
  n,v:Longint;
  a:Array[0..26] Of Longint;
  f:Array[0..12000] Of Int64;

Procedure init;
Var
  i:Longint;
Begin
  Fillchar(a,Sizeof(a),0);
  Fillchar(f,Sizeof(f),0);
  Readln(v,n);
  For i:=1 To v Do Read(a[i]);
  f[0]:=1;
End;

Procedure main;
Var
  i,j:Longint;
Begin
  For i:=1 To v Do
    For j:=a[i] To n Do Inc(f[j],f[j-a[i]]);
End;

Begin
  openf;
  init;
  main;
  Writeln(f[n]);
  closef;
End.
