program BLINK2;
{$I MDLLIB.LIB}
{$I SYSUTILS.LIB}
{$I IOT.LIB}
begin
  while not KeyPressed do
  begin
    sys_timer := 0;
    IoTPutInt('device/analog/out', 4095);
    while sys_timer < 60 do
      ;
    sys_timer := 0;
    IoTPutInt('device/analog/out', 0);
    while sys_timer < 60 do
      ;
  end;
end.
