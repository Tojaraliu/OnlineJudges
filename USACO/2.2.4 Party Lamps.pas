{
ID:ToJaRa
PROG:lamps
LANG:PASCAL
}

Type
  retype=Array[1..100]Of Byte;

Var
  n,i,j,i1,i2,i3,i4,lr:Byte;
  a:Shortint;
  c:word;
  on,off:Array[0..100]Of Byte;
  re:Array[1..16]Of retype;
  sn:Array[1..16]Of Byte;
  s:retype;

Procedure change (f,d:Byte);
Var
  i:Byte;
Begin
  i:=f;
  While i<=n Do Begin
    s[i]:=1-s[i];
    Inc(i,d);
  End;
End;

Function less (Var a,b:retype):Shortint;
Var
  i:Byte;
Begin
  i:=1;
  While (i<=n) And (a[i]=b[i]) Do Inc(i);
  If i>n Then Exit(0);
  If a[i]<b[i] Then Exit(1)
  Else Exit(-1);
End;

Function can:Boolean;
Var
  i,t:Byte;
Begin
  For i:=1 To on[0] Do
    If s[on[i]]=0 Then Exit(False);
  For i:=1 To off[0] Do
    If s[off[i]]=1 Then Exit(False);
  For i:=1 To lr Do Begin
    t:=Less(s,re[sn[i]]);
    If t=0 Then Exit(False);
    If t=1 Then Begin
      Move(sn[i],sn[i+1],lr-i+1);
      Inc(lr);
      re[lr]:=s;
      sn[i]:=lr;
      Exit(True);
    End;
  End;
  Inc(lr);
  re[lr]:=s;
  sn[lr]:=lr;
  Exit(True);
End;

Begin
  Assign(input,'lamps.in');Reset(input);
  Assign(output,'lamps.out');Rewrite(output);
  Readln(n);Readln(c);
  Read(a);
  While a<>-1 Do Begin
    Inc(on[0]);
    on[on[0]]:=a;
    Read(a);
  End;
  readln;Read(a);
  While a<>-1 Do Begin
    Inc(off[0]);
    off[off[0]]:=a;
    Read(a);
  End;
  readln;
  lr:=0;
  For i1:=0 To 1 Do
    For i2:=0 To 1 Do
      For i3:=0 To 1 Do
        For i4:=0 To 1 Do
          If (i1+i2+i3+i4<=c) Then Begin
            Fillchar(s,Sizeof(s),1);
            If i1=1 Then
              Change(1,1);
            If i2=1 Then
              Change(1,2);
            If i3=1 Then
              Change(2,2);
            If i4=1 Then
              Change(1,3);
            can;
  End;
  If lr=0 Then
    Writeln('IMPOSSIBLE')
  Else
    For i:=1 To lr Do Begin
      For j:=1 To n Do
        Write(re[sn[i],j]);
      writeln;
    End;
  //close(output);
End.
