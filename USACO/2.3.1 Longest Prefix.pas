{
ID:ToJaRa
PROG:prefix
LANG:PASCAL
}

Const
  inp='prefix.in';
  outp='prefix.out';

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
  f:Array[0..200001] Of Boolean;
  v:Array[0..200] Of Longint;
  a:Array[0..200] Of String;
  s,str:Ansistring;
  tot,i,len:Longint;
  ch:char;

Procedure main;
Var
  i,j:Longint;
Begin
  tot:=1;
  While ch<>'.' Do Begin
    Read(ch);
    If ch In ['A'..'Z'] Then a[tot]:=a[tot]+ch Else Inc(tot);
  End;
  Dec(tot);
  While Not eof Do Begin
    Readln(str);
    s:=s+str;
  End;
  For i:=1 To tot Do v[i]:=Length(a[i]);
  len:=Length(s);
  f[0]:=True;
  For i:=1 To len Do
    For j:=1 To tot Do
      If (i-v[j]>=0)And(Copy(s,i-v[j]+1,v[j])=a[j])And(f[i-v[j]]) Then Begin
        f[i]:=True; break;
      End;
  For i:=len Downto 0 Do If f[i] Then break;
  Writeln(i);closef;
End;

Begin
  openf;
  main;
End.
