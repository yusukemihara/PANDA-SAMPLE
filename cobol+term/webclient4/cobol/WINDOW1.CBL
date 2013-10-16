       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         WINDOW1.
       ENVIRONMENT         DIVISION.
       CONFIGURATION           SECTION.
       DATA                DIVISION.
       WORKING-STORAGE         SECTION.
       01 CNT PIC 9(5) VALUE 0.
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
               EVALUATE MCP-WIDGET
               WHEN 'button2'
                 PERFORM  200-EVENT
               WHEN 'button3'
                 PERFORM  300-EVENT
               WHEN 'button4'
                 PERFORM  400-EVENT
               WHEN 'button5'
                 PERFORM  500-EVENT
               WHEN 'button6'
                 PERFORM  600-EVENT
               WHEN ANY
                 PERFORM  200-EVENT
               END-EVALUATE
           END-EVALUATE.
           EXIT    PROGRAM.
      *
      ************************************************************************
       100-INIT                SECTION.
           DISPLAY 'init window1'
           INITIALIZE SCRAREA.
           MOVE 'window1' TO  MCP-WINDOW.
           DISPLAY 'init window1 end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       200-EVENT             SECTION.
           DISPLAY 'event 200- window1'.
           DISPLAY 'WINDOW:' MCP-WINDOW.
           DISPLAY 'WIDGET:' MCP-WIDGET.
           DISPLAY 'EVENT:' MCP-EVENT.

           MOVE   'window2' TO  MCP-WINDOW.
           DISPLAY 'event button2 window1 end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       300-EVENT             SECTION.
           DISPLAY 'event 300- window1'.
           DISPLAY 'WINDOW:' MCP-WINDOW.
           DISPLAY 'WIDGET:' MCP-WIDGET.
           DISPLAY 'EVENT:' MCP-EVENT.

           MOVE   'window3' TO  MCP-WINDOW.
           DISPLAY 'event 300 window1 end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       400-EVENT             SECTION.
           DISPLAY 'event 400  window1'.
           DISPLAY 'WINDOW:' MCP-WINDOW.
           DISPLAY 'WIDGET:' MCP-WIDGET.
           DISPLAY 'EVENT:' MCP-EVENT.

           MOVE   'window4' TO  MCP-WINDOW.

           MOVE   '01 a' TO ITEM OF WINDOW4 (1).
           MOVE   '02 b' TO ITEM OF WINDOW4 (2).
           MOVE   '03 c' TO ITEM OF WINDOW4 (3).
           MOVE   '04 d' TO ITEM OF WINDOW4 (4).
           MOVE   '05 f' TO ITEM OF WINDOW4 (5).

           MOVE  5 TO COUNT41.

           DISPLAY 'event 400 window1 end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       500-EVENT             SECTION.
           DISPLAY 'event 500  window1'.
           DISPLAY 'WINDOW:' MCP-WINDOW.
           DISPLAY 'WIDGET:' MCP-WIDGET.
           DISPLAY 'EVENT:' MCP-EVENT.

           MOVE   'window5' TO  MCP-WINDOW.

           MOVE 1 TO CNT.
           PERFORM UNTIL CNT > 30
             MOVE 'ROW10' TO VALUE510(CNT)
             MOVE 'ROW11' TO VALUE511(CNT)
             MOVE 'ROW12' TO VALUE512(CNT)
             MOVE 'ROW20' TO VALUE520(CNT)
             MOVE 'ROW21' TO VALUE521(CNT)
             MOVE 'ROW22' TO VALUE522(CNT)
             MOVE 'F' TO SELECT51(CNT)
             MOVE 'F' TO SELECT52(CNT)
             ADD 1 TO CNT
           END-PERFORM
           MOVE 30 TO COUNT51.
           MOVE 30 TO COUNT52.

           DISPLAY 'event 500 window1 end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       600-EVENT             SECTION.
           DISPLAY 'event 600  window1'.
           DISPLAY 'WINDOW:' MCP-WINDOW.
           DISPLAY 'WIDGET:' MCP-WIDGET.
           DISPLAY 'EVENT:' MCP-EVENT.

           MOVE   'window6' TO  MCP-WINDOW.

           MOVE 1 TO CNT.
           PERFORM UNTIL CNT > 50
             MOVE 'label1' TO CELLDATA61(CNT)
             MOVE 'text2' TO CELLDATA62(CNT)
             MOVE 'text3' TO CELLDATA63(CNT)
             MOVE 'azure' TO BGCOLOR61(CNT)
             MOVE 'bisque' TO BGCOLOR62(CNT)
             MOVE 'peru' TO BGCOLOR63(CNT)
             ADD 1 TO CNT
           END-PERFORM
           MOVE 1 TO TROWATTR.

           DISPLAY 'event 600 window1 end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
           EXIT.
