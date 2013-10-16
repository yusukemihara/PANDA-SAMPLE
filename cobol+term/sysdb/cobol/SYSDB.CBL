       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         SYSDB.
       ENVIRONMENT         DIVISION.
       CONFIGURATION       SECTION.
       DATA                DIVISION.
       WORKING-STORAGE     SECTION.
            COPY    "DB-PATH".
            COPY    "DB-SYSTEM".
       LINKAGE                 SECTION.
            COPY    "MCPAREA".
            COPY    "SPAAREA".
            COPY    "LINKAREA".
            COPY    "SCRAREA".
      ************************************************************************
       PROCEDURE           DIVISION    USING
           MCPAREA
           SPAAREA
           LINKAREA
           SCRAREA.
       000-MAIN                SECTION.
           EVALUATE    MCP-STATUS      ALSO    MCP-WIDGET
             WHEN     'LINK'           ALSO    ANY
               PERFORM 010-INIT
             WHEN     'PUTG'           ALSO    'get'
               PERFORM 020-GET
             WHEN     'PUTG'           ALSO    'set'
               PERFORM 030-SET
             WHEN     'PUTG'           ALSO    'setall'
               PERFORM 040-SETALL
             WHEN     'PUTG'           ALSO    'listkey'
               PERFORM 050-LISTKEY
             WHEN     'PUTG'           ALSO    'listentry'
               PERFORM 060-LISTENTRY
           END-EVALUATE.
           EXIT    PROGRAM.
      ************************************************************************
       010-INIT                SECTION.
           DISPLAY '010-INIT start' 
           INITIALIZE SCR-SYSDB.
           MOVE   5            TO  SCR-NUM.
           MOVE   SPACE        TO  MCP-PUTTYPE.
           MOVE   'sysdb'   TO  MCP-WINDOW.
           DISPLAY '010-INIT end' 
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       020-GET                SECTION.
           DISPLAY '020-GET start' 
           MOVE  'GETVALUE'  TO  MCP-FUNC.
           MOVE  PATH-SYSTEM-PRIMARY
                             TO  MCP-PATH.
           MOVE  MCP-TERM    TO DB-SYSTEM-ID.
      *    MOVE  SCR-NUM     TO DB-SYSTEM-NUM.
           MOVE  10          TO DB-SYSTEM-NUM.
           PERFORM 400-INIT-VALUE.
           PERFORM 300-SCR-TO-DB.
           CALL   'MCPSUB'     USING
                MCPAREA
                DB-SYSTEM.
           IF (MCP-RC = ZERO OR 1)
               DISPLAY 'GETVALUE end' 
               PERFORM 200-DB-TO-SCR
           ELSE
               INITIALIZE SCR-SYSDB
               DISPLAY "GETVALUE failure"
           END-IF.
           DISPLAY '020-GET end' 
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       030-SET                SECTION.
           DISPLAY '030-SET start' 
           MOVE  'SETVALUE'  TO  MCP-FUNC.
           MOVE  PATH-SYSTEM-PRIMARY
                             TO  MCP-PATH.
           MOVE  MCP-TERM    TO DB-SYSTEM-ID.
      *    MOVE  SCR-NUM     TO DB-SYSTEM-NUM.
           MOVE  10          TO DB-SYSTEM-NUM.
           PERFORM 300-SCR-TO-DB.
           CALL   'MCPSUB'     USING
                MCPAREA
                DB-SYSTEM.
           IF (MCP-RC = ZERO OR 1)
               DISPLAY 'GETVALUE end' 
               CONTINUE
           ELSE
               DISPLAY "GETVALUE failure"
           END-IF.
           PERFORM 400-INIT-VALUE.
           DISPLAY '030-SET end' 
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       040-SETALL              SECTION.
           DISPLAY '040-SETALL start' 
           MOVE  'SETVALUEALL'  
                             TO  MCP-FUNC.
           MOVE  PATH-SYSTEM-PRIMARY
                             TO  MCP-PATH.
      *    MOVE  SCR-NUM     TO DB-SYSTEM-NUM.
           MOVE  10          TO DB-SYSTEM-NUM.
           PERFORM 300-SCR-TO-DB.
           CALL   'MCPSUB'     USING
                MCPAREA
                DB-SYSTEM.
           IF (MCP-RC = ZERO OR 1)
               DISPLAY 'SETVALUEALL end' 
               CONTINUE
           ELSE
               DISPLAY "SETVALUEALL failure"
           END-IF.
           PERFORM 400-INIT-VALUE.
           DISPLAY '040-SETALL end' 
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       050-LISTKEY              SECTION.
           DISPLAY '050-LISTKEY start' 
           MOVE  'LISTKEY'  
                             TO  MCP-FUNC.
           MOVE  MCP-TERM    TO DB-SYSTEM-ID.
           MOVE  PATH-SYSTEM-PRIMARY
                             TO  MCP-PATH.
           CALL   'MCPSUB'     USING
                MCPAREA
                DB-SYSTEM.
           IF (MCP-RC = ZERO OR 1)
               DISPLAY 'LISTKEY end' 
               CONTINUE
           ELSE
               DISPLAY "LISTKEY failure"
           END-IF.
           MOVE  DB-SYSTEM-NUM     TO SCR-NUM.
           PERFORM 200-DB-TO-SCR.
           PERFORM 400-INIT-VALUE.
           DISPLAY '050-LISTKEY end' 
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       060-LISTENTRY              SECTION.
           DISPLAY '060-LISTENTRY start' 
           MOVE  'LISTENTRY'  
                             TO  MCP-FUNC.
           MOVE  MCP-TERM    TO DB-SYSTEM-ID.
           MOVE  PATH-SYSTEM-PRIMARY
                             TO  MCP-PATH.
           CALL   'MCPSUB'     USING
                MCPAREA
                DB-SYSTEM.
           IF (MCP-RC = ZERO OR 1)
               DISPLAY 'LISTENTRY end' 
               CONTINUE
           ELSE
               DISPLAY "LISTENTRY failure"
           END-IF.
           MOVE  DB-SYSTEM-NUM      TO SCR-NUM.
           PERFORM 200-DB-TO-SCR.
           PERFORM 400-INIT-VALUE.
           DISPLAY '060-LISTENTRY end' 
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       200-DB-TO-SCR              SECTION.
           MOVE  DB-SYSTEM-KEY(1)  TO SCR-KEY1.
           MOVE  DB-SYSTEM-KEY(2)  TO SCR-KEY2.
           MOVE  DB-SYSTEM-KEY(3)  TO SCR-KEY3.
           MOVE  DB-SYSTEM-KEY(4)  TO SCR-KEY4.
           MOVE  DB-SYSTEM-KEY(5)  TO SCR-KEY5.
           MOVE  DB-SYSTEM-KEY(6)  TO SCR-KEY6.
           MOVE  DB-SYSTEM-KEY(7)  TO SCR-KEY7.
           MOVE  DB-SYSTEM-KEY(8)  TO SCR-KEY8.
           MOVE  DB-SYSTEM-KEY(9)  TO SCR-KEY9.
           MOVE  DB-SYSTEM-KEY(10) TO SCR-KEY10.
           MOVE  DB-SYSTEM-VALUE(1)  TO SCR-VALUE1.
           MOVE  DB-SYSTEM-VALUE(2)  TO SCR-VALUE2.
           MOVE  DB-SYSTEM-VALUE(3)  TO SCR-VALUE3.
           MOVE  DB-SYSTEM-VALUE(4)  TO SCR-VALUE4.
           MOVE  DB-SYSTEM-VALUE(5)  TO SCR-VALUE5.
           MOVE  DB-SYSTEM-VALUE(6)  TO SCR-VALUE6.
           MOVE  DB-SYSTEM-VALUE(7)  TO SCR-VALUE7.
           MOVE  DB-SYSTEM-VALUE(8)  TO SCR-VALUE8.
           MOVE  DB-SYSTEM-VALUE(9)  TO SCR-VALUE9.
           MOVE  DB-SYSTEM-VALUE(10) TO SCR-VALUE10.
           EXIT.
      ************************************************************************
       300-SCR-TO-DB          SECTION.
           MOVE  SCR-KEY1  TO DB-SYSTEM-KEY(1).
           MOVE  SCR-KEY2  TO DB-SYSTEM-KEY(2).
           MOVE  SCR-KEY3  TO DB-SYSTEM-KEY(3).
           MOVE  SCR-KEY4  TO DB-SYSTEM-KEY(4).
           MOVE  SCR-KEY5  TO DB-SYSTEM-KEY(5).
           MOVE  SCR-KEY6  TO DB-SYSTEM-KEY(6).
           MOVE  SCR-KEY7  TO DB-SYSTEM-KEY(7).
           MOVE  SCR-KEY8  TO DB-SYSTEM-KEY(8).
           MOVE  SCR-KEY9  TO DB-SYSTEM-KEY(9).
           MOVE  SCR-KEY10 TO DB-SYSTEM-KEY(10).
           MOVE  SCR-VALUE1  TO DB-SYSTEM-VALUE(1).
           MOVE  SCR-VALUE2  TO DB-SYSTEM-VALUE(2).
           MOVE  SCR-VALUE3  TO DB-SYSTEM-VALUE(3).
           MOVE  SCR-VALUE4  TO DB-SYSTEM-VALUE(4).
           MOVE  SCR-VALUE5  TO DB-SYSTEM-VALUE(5).
           MOVE  SCR-VALUE6  TO DB-SYSTEM-VALUE(6).
           MOVE  SCR-VALUE7  TO DB-SYSTEM-VALUE(7).
           MOVE  SCR-VALUE8  TO DB-SYSTEM-VALUE(8).
           MOVE  SCR-VALUE9  TO DB-SYSTEM-VALUE(9).
           MOVE  SCR-VALUE10 TO DB-SYSTEM-VALUE(10).
           EXIT.
      ************************************************************************
       400-INIT-VALUE          SECTION.
           MOVE  ""  TO SCR-VALUE1.
           MOVE  ""  TO SCR-VALUE2.
           MOVE  ""  TO SCR-VALUE3.
           MOVE  ""  TO SCR-VALUE4.
           MOVE  ""  TO SCR-VALUE5.
           MOVE  ""  TO SCR-VALUE6.
           MOVE  ""  TO SCR-VALUE7.
           MOVE  ""  TO SCR-VALUE8.
           MOVE  ""  TO SCR-VALUE9.
           MOVE  ""  TO SCR-VALUE10.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   1  TO  MCP-RC.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MCPSUB'     USING
                MCPAREA.
