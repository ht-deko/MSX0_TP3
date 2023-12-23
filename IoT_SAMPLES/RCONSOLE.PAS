program RCONSOLE;
type
  LibStr = string[80];
{$I SYSUTILS.LIB}
{$I IOT.LIB}
const
  PA = 'msx/me/if/NET0/';
begin
  { connect }
  IoTPutStr(PA + 'conf/addr', '127.0.0.1');
  IoTPutInt(PA + 'conf/port', 2223);
  IoTPutInt(PA + 'connect', 1);
  { check connect status }
  Delay(500);
  if IoTGetInt(PA + 'connect') <> 1 then
    { error }
    Writeln('connect fail')
  else
  begin
    { send message }
    IoTPutStr(PA + 'msg', 'print "hello"'#13#10);
    Delay(500);
  end;
  { disconnect }  
  IoTPutInt(PA + 'connect', 0);
end.
