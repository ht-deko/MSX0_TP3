{
  M0CLRSSD v1.00
}

program M0CLRSSD;
type
  LibStr = string[80];
{$I SYSUTILS.LIB}
{$I IOT.LIB}

procedure Usage;
begin
  Writeln('M0ClrSsd [/U0] [/U1]');
  Writeln;
  Writeln('/U0  Clear U0 state save data.');
  Writeln('/U1  Clear U1 state save data.');
end; { Usage }

procedure ClearStateSaveData;
var
  i, v: byte;
  s: LibStr;
begin
  for i:=1 to ParamCount do
  begin
    s := ParamStr(i) + '@@@';
    v := Ord(s[3]) - Ord('0');
    if (s[1] in ['-', '/']) and (v in [0..1]) then
      if UpCase(s[2]) = 'U' then
        IotPutInt('msx/u' + s[3] + '/pm/clear', 0);
  end;
end; { ClearStateSaveData }

begin
  if ParamCount = 0 then
    Usage
  else
    ClearStateSaveData;
end.
                                                                   