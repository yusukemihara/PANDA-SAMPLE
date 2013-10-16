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
           DISPLAY 'window2 init'
           INITIALIZE SCRAREA.
           MOVE 'window2' TO MCP-WINDOW.
           DISPLAY 'window2 init end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       700-EVENT             SECTION.
           DISPLAY 'window2 event'.
           MOVE '_dummy' TO MCP-WINDOW.

           MOVE 'http://localhost/HOGE2' TO PATH(1).
           MOVE 'dummy' TO TITLE(1).
           MOVE 0 TO NRETRY(1).
           MOVE 0 TO SHOWDIALOG(1).

           MOVE 'window1' TO SPA-NEXT.
           MOVE 5 TO SPA-TIMES.
           MOVE 'CURRENT' TO MCP-PUTTYPE.
           DISPLAY 'window2 event end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
           EXIT.
