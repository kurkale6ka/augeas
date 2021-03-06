(*
Module: Test_Chrony
  Provides unit tests and examples for the <Chrony> lens.
*)

module Test_Chrony =

  let exampleconf = "# Comment
#Comment
! Comment
!Comment
; Comment
;Comment
% Comment
%Comment

server ntp1.example.com
server ntp2.example.com iburst
server ntp3.example.com presend 2
server ntp4.example.com offline polltarget 4
server ntp5.example.com maxdelay 2 offline
server ntp6.example.com maxdelay 2 iburst presend 2
server ntp7.example.com iburst presend 2 offline
server ntp8.example.com minsamples 8 maxsamples 16 version 3
peer ntpc1.example.com
pool pool1.example.com iburst maxsources 3
stratumweight 0
	driftfile /var/lib/chrony/drift
	rtcsync
makestep 10 -1
bindcmdaddress 127.0.0.1
bindcmdaddress ::1
local stratum 10
keyfile /etc/chrony.keys
commandkey 1
generatecommandkey
manual
noclientlog
logchange 0.5
logdir /var/log/chrony
log rtc measurements
leapsectz right/UTC
broadcast 10 192.168.1.255
broadcast 10 192.168.100.255 123
fallbackdrift 16 19
mailonchange root@localhost 0.5
maxchange 1000 1 2
initstepslew 30 foo.bar.com
initstepslew 30 foo.bar.com baz.quz.com
refclock SHM 0 refid SHM0 delay 0.1 offset 0.2 noselect
refclock PPS /dev/pps0 dpoll 2 poll 3 lock SHM0 rate 5 minsamples 8
smoothtime 400 0.001 leaponly
tempcomp /sys/class/hwmon/hwmon0/temp2_input 30 26000 0.0 0.000183 0.0
tempcomp /sys/class/hwmon/hwmon0/temp2_input 30 /etc/chrony.tempcomp
"

  test Chrony.lns get exampleconf =
    { "#comment" = "Comment" }
  { "#comment" = "Comment" }
  { "#comment" = "Comment" }
  { "#comment" = "Comment" }
  { "#comment" = "Comment" }
  { "#comment" = "Comment" }
  { "#comment" = "Comment" }
  { "#comment" = "Comment" }
  {  }
  { "server" = "ntp1.example.com" }
  { "server" = "ntp2.example.com"
    { "iburst" }
  }
  { "server" = "ntp3.example.com"
    { "presend" = "2" }
  }
  { "server" = "ntp4.example.com"
    { "offline" }
    { "polltarget" = "4" }
  }
  { "server" = "ntp5.example.com"
    { "maxdelay" = "2" }
    { "offline" }
  }
  { "server" = "ntp6.example.com"
    { "maxdelay" = "2" }
    { "iburst" }
    { "presend" = "2" }
  }
  { "server" = "ntp7.example.com"
    { "iburst" }
    { "presend" = "2" }
    { "offline" }
  }
  { "server" = "ntp8.example.com"
    { "minsamples" = "8" }
    { "maxsamples" = "16" }
    { "version" = "3" }
  }
  { "peer" = "ntpc1.example.com" }
  { "pool" = "pool1.example.com"
    { "iburst" }
    { "maxsources" = "3" }
  }
  { "stratumweight" = "0" }
  { "driftfile" = "/var/lib/chrony/drift" }
  { "rtcsync" }
  { "makestep"
    { "threshold" = "10" }
    { "limit" = "-1" }
  }
  { "bindcmdaddress" = "127.0.0.1" }
  { "bindcmdaddress" = "::1" }
  { "local"
    { "stratum" = "10" }
  }
  { "keyfile" = "/etc/chrony.keys" }
  { "commandkey" = "1" }
  { "generatecommandkey" }
  { "manual" }
  { "noclientlog" }
  { "logchange" = "0.5" }
  { "logdir" = "/var/log/chrony" }
  { "log"
    { "rtc" }
    { "measurements" }
  }
  { "leapsectz" = "right/UTC" }
  { "broadcast"
    { "interval" = "10" }
    { "address" = "192.168.1.255" }
  }
  { "broadcast"
    { "interval" = "10" }
    { "address" = "192.168.100.255" }
    { "port" = "123" }
  }
  { "fallbackdrift"
    { "min" = "16" }
    { "max" = "19" }
  }
  { "mailonchange"
    { "emailaddress" = "root@localhost" }
    { "threshold" = "0.5" }
  }
  { "maxchange"
    { "threshold" = "1000" }
    { "delay" = "1" }
    { "limit" = "2" }
  }
  { "initstepslew"
    { "threshold" = "30" }
    { "address" = "foo.bar.com" }
  }
  { "initstepslew"
    { "threshold" = "30" }
    { "address" = "foo.bar.com" }
    { "address" = "baz.quz.com" }
  }
  { "refclock"
    { "driver" = "SHM" }
    { "parameter" = "0" }
    { "refid" = "SHM0" }
    { "delay" = "0.1" }
    { "offset" = "0.2" }
    { "noselect" }
  }
  { "refclock"
    { "driver" = "PPS" }
    { "parameter" = "/dev/pps0" }
    { "dpoll" = "2" }
    { "poll" = "3" }
    { "lock" = "SHM0" }
    { "rate" = "5" }
    { "minsamples" = "8" }
  }
  { "smoothtime"
    { "maxfreq" = "400" }
    { "maxwander" = "0.001" }
    { "leaponly" }
  }
  { "tempcomp"
    { "sensorfile" = "/sys/class/hwmon/hwmon0/temp2_input" }
    { "interval" = "30" }
    { "t0" = "26000" }
    { "k0" = "0.0" }
    { "k1" = "0.000183" }
    { "k2" = "0.0" }
  }
  { "tempcomp"
    { "sensorfile" = "/sys/class/hwmon/hwmon0/temp2_input" }
    { "interval" = "30" }
    { "pointfile" = "/etc/chrony.tempcomp" }
  }


(* Local Variables: *)
(* mode: caml       *)
(* End:             *)
