program BLINK;
type
  LibStr = string[80];
{$I SYSUTILS.LIB}
{$I IOT.LIB}
begin
  while not KeyPressed do
  begin
    IoTPutInt('device/analog/out', 4095);
    Delay(894);
    IoTPutInt('device/analog/out', 0);
    Delay(894);
  end;
end.
