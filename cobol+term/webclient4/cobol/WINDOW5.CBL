       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         WINDOW5.
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
               PERFORM  700-EVENT
           END-EVALUATE.
           EXIT    PROGRAM.
      *
      ************************************************************************
       100-INIT                SECTION.
           DISPLAY 'nomally does not reach here'
           INITIALIZE WINDOW5.
           MOVE 'window5' TO  MCP-WINDOW.

           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       700-EVENT             SECTION.
           DISPLAY 'event window5'.
           DISPLAY 'WINDOW:' MCP-WINDOW.
           DISPLAY 'WIDGET:' MCP-WIDGET.
           DISPLAY 'EVENT:' MCP-EVENT.

           MOVE 'window5' TO  MCP-WINDOW.

           EVALUATE    MCP-WIDGET 
           WHEN 'button1'
             MOVE 'window1' TO MCP-WINDOW
           WHEN 'pandaclist1'
             DISPLAY 'pandaclist1'
           WHEN 'pandaclist2'
             DISPLAY 'pandaclist2'
           END-EVALUATE.

           DISPLAY 'event window5 end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
           EXIT.
