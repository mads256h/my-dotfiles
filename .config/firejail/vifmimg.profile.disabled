quiet

include disable-common.inc
include disable-devel.inc
include disable-exec.inc
include disable-X11.inc
#include disable-interpreters.inc
include disable-proc.inc
#include disable-programs.inc

memory-deny-write-execute

apparmor
caps.drop all
machine-id
net none
no3d
nogroups
nodvd
noinput
nonewprivs
noprinters
noroot
nosound
notv
nou2f
novideo
seccomp
seccomp.block-secondary
shell none

private-bin sh,bash,vifmimg,stat,readlink,sha256sum,awk,ffmpegthumbnailer,epub-thumbnailer,pdftoppm,ddjvu,ffmpeg,fontpreview
private-dev
x11 none

dbus-user none
dbus-system none
