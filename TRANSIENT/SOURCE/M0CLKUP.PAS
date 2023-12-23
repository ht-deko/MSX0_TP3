(*
  M0CLKUP v1.10
*)
program M0CLKUP;
type
  LibStr = string[80];
  {$I SYSUTILS.LIB}
  {$I IOT.LIB}
var
  Speed, Ret: Integer;
  s: LibStr;
begin
  if ParamCount = 0 then
  begin
    Speed := IoTGetInt('msx/u0/pm/cpu/percent');
    WriteLn('Speed: ', Speed, '%');
  end
  else
  begin
    s := ParamStr(1);
    Val(s, Speed, Ret);
    if Ret = 0 then
    begin
      if Speed < 32 then
        Speed := 32
      else if Speed > 255 then
        Speed := 255;
      IoTPutInt('msx/u0/pm/cpu/percent', Speed);
      WriteLn('Set to: ', Speed, '%');
    end
    else
      WriteLn('Invalid value: ', ParamStr(1));
  end;
end.
