       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         WINDOW1.
       ENVIRONMENT         DIVISION.
       CONFIGURATION           SECTION.
       DATA                DIVISION.
       WORKING-STORAGE         SECTION.
       01  CNT      PIC 9(5) VALUE 1.
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
           EVALUATE    MCP-STATUS 
             WHEN      'LINK' 
               PERFORM  100-INIT
             WHEN      ANY  
               PERFORM  700-EVENT
           END-EVALUATE.
           EXIT    PROGRAM.
      *
      ************************************************************************
       100-INIT                SECTION.
           DISPLAY 'init'
           INITIALIZE SCRAREA.
           MOVE   'window1' TO  MCP-WINDOW.

           MOVE  "#000000" TO PANDAENTRY1.
           MOVE  "#FFFFEE" TO PANDAENTRY2.

           MOVE 1 TO CNT.
           PERFORM UNTIL CNT > 50
             MOVE  "value0"  TO VALUE0(CNT)
             MOVE  "value1"  TO VALUE1(CNT)
             MOVE  "value2"  TO VALUE2(CNT)
             MOVE  "value3"  TO VALUE3(CNT)
             MOVE  "value4"  TO VALUE4(CNT)
             MOVE  "" TO FGCOLOR(CNT)
             MOVE  "" TO BGCOLOR(CNT)
             ADD 1 TO CNT
           END-PERFORM.

           MOVE 50 TO COUNT1.

           DISPLAY 'init end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       700-EVENT             SECTION.
           DISPLAY 'event'.

           MOVE 1 TO CNT.
           PERFORM UNTIL CNT > 50
             MOVE  PANDAENTRY1 TO FGCOLOR(CNT)
             MOVE  PANDAENTRY2 TO BGCOLOR(CNT)
             ADD 1 TO CNT
           END-PERFORM.

           MOVE   'window1' TO  MCP-WINDOW.
           DISPLAY 'event end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
           EXIT.
