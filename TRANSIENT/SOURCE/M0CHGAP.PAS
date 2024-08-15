(*
  M0CHGAP v1.20
*)
program M0CHGAP;
type
  LibStr = string[80];
{$I SYSUTILS.LIB}
{$I IOT.LIB}

  procedure ShowApListR;
  const
    Arrow: array [boolean] of string[4] = ('    ', '--> ');
  var
    cAP, s: LibStr;
    cIdx, i: byte;
  begin
    cIdx := IoTGetInt('conf/wifi/id');
    for i:=0 to 4 do
    begin
      cAP := '[' + Chr($30+i) + '] ';
      case i of
        0:
          cAP := cAP + 'OFF';
        1..3:
          cAP := cAP + IoTGetStr('conf/wifi/list/' + Chr($30+i) + '/ssid');
        4:
          cAP := cAP + '<AP Mode>';
      end;
      WriteLn(Arrow[i = cIdx], cAP);
    end;
  end; { ShowApListR }

  procedure ChangeAP;
  var
    s: LibStr;
    Idx, ret: Integer;
  begin
    s := ParamStr(1);
    Val(s, Idx, Ret);
    if (Ret = 0) and (Idx in [0..4]) then
    begin
      IoTPutInt('conf/wifi/id', Idx);
      IoTPutInt('conf/save', 1);
      IoTPutInt('host/wifi/restart', 1);
      ShowApListR;
    end
    else
      WriteLn('Invalid Idx: ', ParamStr(1));
  end; { ChangeAP }
begin
  if ParamCount = 0 then
    ShowApListR
  else
    ChangeAP;
end.
