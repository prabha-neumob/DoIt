#
# Use `nmake' to build.
#

CFLAGS = /nologo /W3 /YX /O2 /Yd /D_WINDOWS /DDEBUG /ML /Fd
LFLAGS = /incremental:no

.c.obj:
	cl $(COMPAT) $(CFLAGS) /c $*.c

LIBS = gdi32.lib user32.lib wsock32.lib shell32.lib

all: doit.exe

doit.exe: listener.obj doit.obj doitlib.obj doit.res
	link $(LFLAGS) -out:doit.exe listener.obj doit.obj doitlib.obj doit.res $(LIBS)

doit.res: doit.rc doit.ico doitsmall.ico
	rc -r doit.rc

clean:
	del *.obj
	del *.exe
	del *.res
	del *.pch
	del *.aps
	del *.ilk
	del *.pdb
	del *.rsp
