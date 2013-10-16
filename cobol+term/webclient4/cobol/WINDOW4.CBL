       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         WINDOW4.
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
           DISPLAY 'init window4'
           INITIALIZE WINDOW4.
           MOVE 'window4' TO  MCP-WINDOW.

           DISPLAY 'init window4 end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       700-EVENT             SECTION.
           DISPLAY 'event window4'.
           DISPLAY 'WINDOW:' MCP-WINDOW.
           DISPLAY 'WIDGET:' MCP-WIDGET.
           DISPLAY 'EVENT:' MCP-EVENT.

           MOVE 'window4' TO  MCP-WINDOW.

           EVALUATE    MCP-WIDGET 
           WHEN 'button1'
             MOVE 'window1' TO MCP-WINDOW
           WHEN 'pandacombo_entry1'
             DISPLAY 'pandacombo_entry1'
             MOVE PE41 TO L41
           END-EVALUATE.

           DISPLAY 'event window4 end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
           EXIT.
