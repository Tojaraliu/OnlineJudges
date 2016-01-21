{
ID:ToJaRa
PROG:nocows
LANG:PASCAL
}

Const
  inp='nocows.in';
  outp='nocows.out';

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
  f,st:Array[0..200,0..200] Of Longint;
  n,k,s:Longint;

Procedure init;
Begin
  Readln(n,k);
  Fillchar(f,Sizeof(f),0);
  Fillchar(st,Sizeof(st),0);
End;

Procedure main;
Var
  i,j:Longint;
Begin
  f[1,1]:=1;
  For i:=2 To k Do
    For j:=1 To n Do Begin
      For s:=1 To j-1 Do Begin
        f[i,j]:=(f[i,j]+st[i-2,s]*f[i-1,j-s-1]) Mod 9901;
        f[i,j]:=(f[i,j]+f[i-1,s]*st[i-2,j-s-1]) Mod 9901;
        f[i,j]:=(f[i,j]+f[i-1,s]*f[i-1,j-s-1]) Mod 9901;
      End;
    st[i-1,j]:=(st[i-2,j]+f[i-1,j]) Mod 9901;
  End;
  Writeln(f[k,n]);
End;

Begin
  openf;
  init;
  main;
  closef;
End.
