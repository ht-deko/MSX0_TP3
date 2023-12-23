(*
  M0SETUP v1.00
*)
program M0SETUP;
type
  LibStr = string[80];
{$I SYSUTILS.LIB}
{$I IOT.LIB}

begin
  IoTPutInt('conf/setup', 1);
  IoTPutInt('conf/save', 1);
  IoTPutInt('host/power/reboot', 1);
end.
