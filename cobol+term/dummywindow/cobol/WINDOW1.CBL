      * 日本語いーゆーしーじぇぴー
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
               PERFORM  700-EVENT
           END-EVALUATE.
           EXIT    PROGRAM.
      *
      ************************************************************************
       100-INIT                SECTION.
           DISPLAY 'window1 init'
           INITIALIZE SCRAREA.
           MOVE 'window1' TO MCP-WINDOW.
           DISPLAY 'window1 init end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       700-EVENT             SECTION.
           DISPLAY 'window1 event'.
           MOVE '_dummy' TO MCP-WINDOW.
           MOVE 'window2' TO SPA-NEXT.
           MOVE 3 TO SPA-TIMES.
           MOVE 'CURRENT' TO MCP-PUTTYPE.

           MOVE 'http://localhost/hoge1' TO PATH(1).
           MOVE 'dummy' TO TITLE(1).
           MOVE 0 TO NRETRY(1).
           MOVE 0 TO SHOWDIALOG(1).

           DISPLAY 'window1 event end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
           EXIT.
