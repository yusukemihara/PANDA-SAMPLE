       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         WINDOW2.
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
           DISPLAY 'init window2'
           INITIALIZE WINDOW2.
           MOVE   'window2' TO  MCP-WINDOW.
           MOVE SPA-ENTRYDATA1 TO ENTRYDATA1 OF WINDOW2.
           MOVE 'window2' TO LABELDATA1 OF WINDOW2.
           DISPLAY 'init window2 end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       700-EVENT             SECTION.
           DISPLAY 'event window2'.
           DISPLAY 'WINDOW:' MCP-WINDOW.
           DISPLAY 'WIDGET:' MCP-WIDGET.
           DISPLAY 'EVENT:' MCP-EVENT.

           DISPLAY 'LABEL:' LABELDATA1 OF WINDOW2.
           DISPLAY 'ENTRY:' ENTRYDATA1 OF WINDOW2.

           MOVE ENTRYDATA1 OF WINDOW2 TO SPA-ENTRYDATA1.
           MOVE ENTRYDATA1 OF WINDOW2 TO LABELDATA1 OF WINDOW1.

           MOVE   'window1' TO  MCP-WINDOW.
           DISPLAY 'event window2 end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
           EXIT.
