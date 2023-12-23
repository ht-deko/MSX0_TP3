program SEND2NET;
type
  IntStr = string[8];
{$I MDLLIB.LIB}
{$I SYSUTILS.LIB}
{$I IOT.LIB}
const
  HS = '54.65.206.59';
  CH = 'xxxxx';
  WK = 'xxxxxxxxxxxxxxxx';
  PA = 'msx/me/if/NET0/';
  WT = 30;
  RB = 0;
var
  Flg: Boolean;
  I, D1, D2, D3: Integer;
  SM: array [0..8] of LibStr;
  function ToString(v: Integer): IntStr;
  var
    s: IntStr;
  begin
    Str(v, s);
    ToString := s;
  end;
  function MLen(s, e: Byte): Byte;
  var
    i, v: Integer;
  begin
    v := 0;
    for i:=s to e do
      v := v + Length(SM[i]);
    MLen := v;
  end;
begin
  { user setting }
  if CH ='xxxxx' then
  begin
    Writeln('please change the value CH and WK to your enviroment.');
    Exit;
  end;
  Flg := RB = 1;
  repeat
    { connect }
    IoTPutStr(PA + 'conf/addr', HS);
    IoTPutInt(PA + 'conf/port', 80);
    IoTPutInt(PA + 'connect', 1);
    { check connect status }
    Delay(500);
    if IoTGetInt(PA + 'connect') <> 1 then
      { error }
      Writeln('connect fail')
    else
    begin
      { get sensor value }
      D1 := IoTGetInt('device/dht/temperature');
      D2 := IoTGetInt('device/dht/humidity');
      D3 := IoTGetInt('host/battery/level');
      { create message }
      SM[5] := '{"writeKey":"' + WK + '",';
      SM[6] := '"d1":"' + ToString(D1) + '",';
      SM[7] := '"d2":"' + ToString(D2) + '",';
      SM[8] := '"d3":"' + ToString(D3) + '"}'#13#10;
      SM[0] := 'POST /api/v2/channels/' + CH + '/data HTTP/1.1'#13#10;
      SM[1] := 'Host: ' + HS + #13#10;
      SM[2] := 'Content-Length: ' + ToString(MLen(5, 8)) + #13#10;
      SM[3] := 'Content-Type: application/json'#13#10;
      SM[4] := #13#10;
      { send message }
      Writeln(#13#10'---- Send Message ----');
      for I:=0 to 8 do
      begin
        Write(SM[I]);
        IoTPutStr(PA + 'msg', SM[I]);
      end;
      Delay(500);
      { receive message }
      Writeln(#13#10'---- Receive Message ----');
      for I:=0 to 10 do
      begin
        Write(IoTGetStr(PA + 'msg'));
        Delay(100);
      end;
    end;
    { disconnect }
    IoTPutInt(PA + 'connect', 0);
    { loop }
    if RB = 0 then
    begin
      { wait }
      Writeln(#13#10'---- Wait (', WT, ' sec ) ----');
      sys_timer := 0;
      while (sys_timer < WT * 60) and (not Flg) do
        Flg := Flg or KeyPressed;
    end
    else
    begin
      { system reboot }
      Writeln(#13#10'---- Sleep (', WT, ' sec ) ----');
      IoTPutInt('host/power/wait', WT);
      IoTPutInt('host/power/reboot', 1);
    end;
  until Flg;
end.
