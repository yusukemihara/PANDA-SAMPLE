        01  SCRAREA.
            02  SCREENDATA.
              03  WINDOW1.
                04  TITLE   PIC X(256).
                04  POPUP-SUMMARY   PIC X(256).
                04  POPUP-BODY  PIC X(1024).
                04  POPUP-ICON  PIC X(256).
                04  POPUP-TIMEOUT   PIC S9(9)   BINARY.
              03  WINDOW2.
                04  TITLE   PIC X(256).
                04  POPUP-SUMMARY   PIC X(256).
                04  POPUP-BODY  PIC X(1024).
                04  POPUP-ICON  PIC X(256).
                04  POPUP-TIMEOUT   PIC S9(9)   BINARY.
                04  FIXED1.
                  05  LABEL1.
                    06  L1STR   PIC X(128).
                  05  TOGGLE1.
                    06  T1BOOL  PIC X.
                  05  CHECK1.
                    06  C1BOOL  PIC X.
                  05  RADIO1.
                    06  R1BOOL  PIC X.
                  05  RADIO2.
                    06  R2BOOL  PIC X.
                  05  RADIO3.
                    06  R3BOOL  PIC X.
                  05  RADIO4.
                    06  R4BOOL  PIC X.
                  05  RADIO5.
                    06  R5BOOL  PIC X.
                  05  RADIO6.
                    06  R6BOOL  PIC X.
              03  WINDOW3.
                04  TITLE   PIC X(256).
                04  POPUP-SUMMARY   PIC X(256).
                04  POPUP-BODY  PIC X(1024).
                04  POPUP-ICON  PIC X(256).
                04  POPUP-TIMEOUT   PIC S9(9)   BINARY.
                04  FIXED1.
                  05  LABEL1.
                    06  L31STR  PIC X(128).
                  05  LABEL2.
                    06  L32STR  PIC X(128).
                  05  NUMBERENTRY1.
                    06  NUMBER31    PIC S9(6)V9(2).
                  05  PANDAENTRY1.
                    06  PE31STR PIC X(64).
                  05  PANDAENTRY2.
                    06  PE32STR PIC X(64).
                  05  PANDAENTRY3.
                    06  PE33STR PIC X(64).
              03  WINDOW4.
                04  TITLE   PIC X(256).
                04  POPUP-SUMMARY   PIC X(256).
                04  POPUP-BODY  PIC X(1024).
                04  POPUP-ICON  PIC X(256).
                04  POPUP-TIMEOUT   PIC S9(9)   BINARY.
                04  FIXED1.
                  05  LABEL1.
                    06  L41 PIC X(256).
                  05  PANDACOMBO1.
                    06  PANDACOMBO-ENTRY1.
                      07  PE41    PIC X(256).
                    06  COUNT41   PIC S9(9)   BINARY.
                    06  ITEM
                            PIC X(256)  OCCURS  10 TIMES.
              03  WINDOW5.
                04  TITLE   PIC X(256).
                04  POPUP-SUMMARY   PIC X(256).
                04  POPUP-BODY  PIC X(1024).
                04  POPUP-ICON  PIC X(256).
                04  POPUP-TIMEOUT   PIC S9(9)   BINARY.
                04  FIXED1.
                  05  LABEL7.
                    06  L51 PIC X(128).
                  05  SCROLLEDWINDOW1.
                    06  PANDACLIST1.
                      07  COUNT51   PIC S9(9)   BINARY.
                      07  ROW PIC S9(9)   BINARY.
                      07  ITEM            OCCURS  30 TIMES.
                        08  VALUE510  PIC X(64).
                        08  VALUE511  PIC X(64).
                        08  VALUE512  PIC X(64).
                      07  SELECT51
                              PIC X       OCCURS  30 TIMES.
                  05  SCROLLEDWINDOW2.
                    06  PANDACLIST2.
                      07  COUNT52   PIC S9(9)   BINARY.
                      07  ROW PIC S9(9)   BINARY.
                      07  ITEM            OCCURS  30 TIMES.
                        08  VALUE520  PIC X(64).
                        08  VALUE521  PIC X(64).
                        08  VALUE522  PIC X(64).
                      07  SELECT52
                              PIC X       OCCURS  30 TIMES.
              03  WINDOW6.
                04  TITLE   PIC X(256).
                04  POPUP-SUMMARY   PIC X(256).
                04  POPUP-BODY  PIC X(1024).
                04  POPUP-ICON  PIC X(256).
                04  POPUP-TIMEOUT   PIC S9(9)   BINARY.
                04  FIXED1.
                  05  SCROLLEDWINDOW1.
                    06  HPOS    PIC S9(9)   BINARY.
                    06  VPOS    PIC S9(9)   BINARY.
                    06  PANDATABLE1.
                      07  STATE   PIC S9(9)   BINARY.
                      07  STYLE   PIC X(256).
                      07  TROW    PIC S9(9)   BINARY.
                      07  TROWATTR    PIC S9(9)   BINARY.
                      07  TCOLUMN PIC S9(9)   BINARY.
                      07  TVALUE  PIC X(256).
                      07  ROWDATA         OCCURS  50 TIMES.
                        08  COLUMN1.
                          09  CELLDATA61    PIC X(256).
                          09  FGCOLOR61 PIC X(256).
                          09  BGCOLOR61 PIC X(256).
                        08  COLUMN2.
                          09  CELLDATA62    PIC X(256).
                          09  FGCOLOR62 PIC X(256).
                          09  BGCOLOR62 PIC X(256).
                        08  COLUMN3.
                          09  CELLDATA63    PIC X(256).
                          09  FGCOLOR63 PIC X(256).
                          09  BGCOLOR63 PIC X(256).
