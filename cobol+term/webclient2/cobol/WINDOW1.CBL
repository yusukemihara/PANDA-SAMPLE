       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         WINDOW1.
       ENVIRONMENT         DIVISION.
       CONFIGURATION           SECTION.
       DATA                DIVISION.
       WORKING-STORAGE         SECTION.
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
               WHEN 'button3'
                 PERFORM  300-BUTTON3-EVENT
               WHEN ANY
                 PERFORM  200-BUTTON1-EVENT
               END-EVALUATE
           END-EVALUATE.
           EXIT    PROGRAM.
      *
      ************************************************************************
       100-INIT                SECTION.
           DISPLAY 'init window1'
           INITIALIZE WINDOW1.
           MOVE 'window1' TO  MCP-WINDOW.
           MOVE 'hogehoge' TO ENTRYDATA1 OF WINDOW1.
           MOVE 'window1' TO LABELDATA1 OF WINDOW1.
           DISPLAY 'init window1 end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       200-BUTTON1-EVENT             SECTION.
           DISPLAY 'event 200-button1 window1'.
           DISPLAY 'WINDOW:' MCP-WINDOW.
           DISPLAY 'WIDGET:' MCP-WIDGET.
           DISPLAY 'EVENT:' MCP-EVENT.

           DISPLAY 'LABEL:' LABELDATA1 OF WINDOW1.
           DISPLAY 'ENTRY:' ENTRYDATA1 OF WINDOW1.

           MOVE ENTRYDATA1 OF WINDOW1 TO SPA-ENTRYDATA1.
           MOVE ENTRYDATA1 OF WINDOW1 TO LABELDATA1 OF WINDOW2.

           MOVE   'window2' TO  MCP-WINDOW.
           DISPLAY 'event button1 window1 end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       300-BUTTON3-EVENT             SECTION.
           DISPLAY 'event 300-button3 window1'.
           DISPLAY 'WINDOW:' MCP-WINDOW.
           DISPLAY 'WIDGET:' MCP-WIDGET.
           DISPLAY 'EVENT:' MCP-EVENT.

           DISPLAY 'LABEL:' LABELDATA1 OF WINDOW1.
           DISPLAY 'ENTRY:' ENTRYDATA1 OF WINDOW1.

           MOVE 'RELOAD' TO LABELDATA1 OF WINDOW1.

           MOVE   'window1' TO  MCP-WINDOW.
           DISPLAY 'event button3 window1 end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
           EXIT.
