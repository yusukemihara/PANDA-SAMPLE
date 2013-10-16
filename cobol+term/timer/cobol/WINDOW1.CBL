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
           EVALUATE    MCP-STATUS ALSO MCP-WIDGET
             WHEN      'LINK'  ALSO ANY
               PERFORM  100-INIT
             WHEN      ANY  ALSO 'pandaentry1'
               PERFORM  700-EVENT 
             WHEN      ANY  ALSO 'pandatimer1'
               PERFORM  800-EVENT 
           END-EVALUATE.
           EXIT    PROGRAM.
      *
      ************************************************************************
       100-INIT                SECTION.
           DISPLAY 'init'
           INITIALIZE SCRAREA.
           MOVE   'window1' TO  MCP-WINDOW.
           MOVE 0 TO DURATION.
           MOVE '' TO ENTRY1.
           MOVE 'idle' TO LABEL1.
           DISPLAY 'init end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       700-EVENT             SECTION.
           DISPLAY 'event'.
           MOVE   'window1' TO  MCP-WINDOW.
           MOVE ENTRY1 TO DURATION.
           MOVE '' TO ENTRY1.
           MOVE 'waiting timer' TO LABEL1.
           DISPLAY 'event end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       800-EVENT             SECTION.
           DISPLAY 'event'.
           MOVE   'window1' TO  MCP-WINDOW.
           MOVE 0 TO DURATION.
           MOVE '' TO ENTRY1.
           MOVE 'idle' TO LABEL1.
           DISPLAY 'event end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
           EXIT.
