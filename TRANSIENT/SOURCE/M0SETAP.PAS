(*
  M0SETAP v1.20
*)
program M0SETAP;
type
  LibStr = string[80];
{$I SYSUTILS.LIB}
{$I IOT.LIB}

  procedure ShowApListA;
  const
    Arrow: array [boolean] of string[4] = ('    ', '--> ');
  var
    List, Last, p: PItem;
    n: Integer;
  begin
    Writeln('Available AP:');
    n := IotFindCount('host/wifi/aplist');
    List := nil;
    IotFind('host/wifi/aplist', List, Last);
    p := List;
    while p <> nil do
    begin
      WriteLn(Arrow[False], p^.Data);
      p := p^.Next;
    end;
    ClearListItem(List);
    WriteLn;
  end; { ShowApListA }

  procedure ShowApListR;
  const
    Arrow: array [boolean] of string[4] = ('    ', '--> ');
  var
    cAP, s: LibStr;
    cIdx, i: byte;
  begin
    Writeln('Registered AP:');
    cIdx := IotGetInt('conf/wifi/id');
    for i:=1 to 3 do
    begin
      cAP := '[' + Chr($30+i) + '] ' + IotGetStr('conf/wifi/list/' + Chr($30+i) + '/ssid');
      WriteLn(Arrow[i = cIdx], cAP);
    end;
  end; { ShowApListR }

  procedure SetAP;
  var
    s, ssid, pass: LibStr;
    Idx, Ret: integer;
    rFlg: boolean;
  begin
    s := ParamStr(1);
    Val(s, Idx, Ret);
    if (Ret = 0) and (Idx in [1..3]) then
    begin
      s := 'conf/wifi/list/' + Chr($30+Idx);
      ssid := ParamStr(2);
      pass := ParamStr(3);
      if ssid = '-' then
      begin
        ssid := ' ';
        pass := ' ';
      end;
      IoTPutStr(s + '/ssid', ssid);
      IoTPutStr(s + '/pass', pass);
      rFlg := IoTGetInt('conf/wifi/id') = Idx;
      s := ParamStr(4);
      if UpperCase(s) = 'ON' then
      begin
        rFlg := True;
        IoTPutInt('conf/wifi/id', Idx);
      end;
      IoTPutInt('conf/save', 1);
      if rFlg then
        IoTPutInt('host/wifi/restart', 1);
      ShowApListR;
    end
    else
      WriteLn('Invalid Idx: ', ParamStr(1));
  end; { SetAP }
begin
  if ParamCount = 0 then
  begin
    ShowApListA;
    ShowApListR;
  end
  else
    SetAP;
end.
