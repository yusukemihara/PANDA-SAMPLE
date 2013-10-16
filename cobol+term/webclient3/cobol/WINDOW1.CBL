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
               WHEN 'button2'
                 PERFORM  200-BUTTON2-EVENT
               WHEN ANY
                 PERFORM  200-BUTTON2-EVENT
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
       200-BUTTON2-EVENT             SECTION.
           DISPLAY 'event 200-button2 window1'.
           DISPLAY 'WINDOW:' MCP-WINDOW.
           DISPLAY 'WIDGET:' MCP-WIDGET.
           DISPLAY 'EVENT:' MCP-EVENT.

           MOVE   'window2' TO  MCP-WINDOW.
           DISPLAY 'event button2 window1 end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
           EXIT.
