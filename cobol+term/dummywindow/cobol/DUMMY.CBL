       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         DUMMY.
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
           DISPLAY 'dummy init'
           INITIALIZE SCRAREA.
           DISPLAY 'dummy init end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       700-EVENT             SECTION.
           DISPLAY 'dummy event'.
           DISPLAY SPA-TIMES.
           IF SPA-TIMES = 0
             MOVE SPA-NEXT TO MCP-WINDOW
           ELSE
             MOVE '_dummy' TO MCP-WINDOW
             COMPUTE SPA-TIMES = SPA-TIMES - 1
           END-IF.
           MOVE 'CURRENT' TO MCP-PUTTYPE.
           DISPLAY 'dummy event end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
           EXIT.
