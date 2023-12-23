(*
  M0VER v1.00
*)
program M0VER;
{$I SYSUTILS.LIB}
{$I MDLLIB.LIB}
{$I DISKTOOL.LIB}
{$I IOT.LIB}
type
  verstr = string[5];
var
  s: verstr;
  v: integer;
  function GetVerStr(i: integer): verstr;
  begin
    GetVerStr := Chr((i shr 8) and 7 + $30) + '.' +
                 Chr((i shr 4) and 7 + $30) + Chr(i and 7 + $30);
  end;
begin
  { System software Version }
  Write('System Software'#$09'ver');
  WriteLn(IotGetStr('host/sw_version'));
  { MSX-DOS version }
  LibRegs.C := $6F;
  MSXBdos;
  if LibRegs.B < 2 then
    WriteLn('MSX-DOS'#$09'(Disk)'#$09'ver1.x')
  else
  begin
    s := GetVerStr(LibRegs.BC);
    Writeln('MSX-DOS'#$09'(ROM)'#$09'ver', s);
    s := GetVerStr(LibRegs.DE);
    Writeln(#$09'(Disk)'#$09'ver', s);
  end;
  { CP/M version }
  v := BdosHL($0C) and $00FF;
  s := Chr(v shr 4 + $30) + '.' + Chr(v and 7 + $30);
  WriteLn(#$09'(CP/M)'#$09'ver', s);
end.
