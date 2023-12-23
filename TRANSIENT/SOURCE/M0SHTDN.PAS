(*
  M0SHTDN v1.00
*)
program M0SHTDN;
type
  LibStr = string[80];
{$I SYSUTILS.LIB}
{$I IOT.LIB}
var
  Mode: byte;
  s: LibStr;
begin
  if ParamCount = 0 then
    Mode := 1
  else
  begin
    s := Paramstr(1);
    if s[1] in ['-', '/'] then
    begin
      if      s[2] in ['H', 'h'] then
        Mode := 1
      else if s[2] in ['R', 'r'] then
        Mode := 2
      else
        Mode := 0;
    end
    else
      Mode := 0;
  end;
  case Mode of
    0: Writeln('Invalid parameter: ', s);
    1: IoTPutInt('host/power/off', 1);
    2: IoTPutInt('host/power/reboot', 1);
  end;
end.
