        01  SCRAREA.
            02  SCREENDATA.
              03  WINDOW1.
                04  TITLE   PIC X(256).
                04  POPUP-SUMMARY   PIC X(256).
                04  POPUP-BODY  PIC X(1024).
                04  POPUP-ICON  PIC X(256).
                04  POPUP-TIMEOUT   PIC S9(9)   BINARY.
                04  FIXED1.
                  05  PANDAENTRY1.
                    06  V1  PIC X(16).
                  05  PANDAENTRY2.
                    06  V2  PIC X(16).
                  05  PANDACLIST1.
                    06  COUNT1   PIC S9(9)   BINARY.
                    06  ROW PIC S9(9)   BINARY.
                    06  ITEM            OCCURS  50 TIMES.
                      07  VALUE0  PIC X(64).
                      07  VALUE1  PIC X(64).
                      07  VALUE2  PIC X(64).
                      07  VALUE3  PIC X(64).
                      07  VALUE4  PIC X(64).
                    06  SELECT1
                            PIC X       OCCURS  50 TIMES.
                    06  FGCOLOR
                            PIC X(16)   OCCURS  50 TIMES.
                    06  BGCOLOR
                            PIC X(16)   OCCURS  50 TIMES.
