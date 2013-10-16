      * 日本語いーゆーしーじぇぴー
       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         TESTVISIBLE.
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
           DISPLAY 'init'
           INITIALIZE SCRAREA.
           MOVE   'testvisible' TO  MCP-WINDOW.
           MOVE 'T' TO SPA-VISIBLE.
           MOVE 'T' TO VISIBLE OF NUMBERENTRY1.
           MOVE 'T' TO VISIBLE OF PANDAENTRY1.
           MOVE 'T' TO VISIBLE OF PANDATEXT1.
           MOVE 'T' TO VISIBLE OF PANDACOMBO1.
           MOVE 'T' TO VISIBLE OF BUTTON1.
           MOVE 'T' TO VISIBLE OF LABEL1.
           MOVE 'T' TO VISIBLE OF FRAME1.
           DISPLAY 'init end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       700-EVENT             SECTION.
           DISPLAY 'event'.

           IF SPA-VISIBLE = 'T'
             DISPLAY 'true'
             MOVE 'F' TO VISIBLE OF NUMBERENTRY1
             MOVE 'F' TO VISIBLE OF PANDAENTRY1
             MOVE 'F' TO VISIBLE OF PANDATEXT1
             MOVE 'F' TO VISIBLE OF PANDACOMBO1
             MOVE 'F' TO VISIBLE OF BUTTON1
             MOVE 'F' TO VISIBLE OF LABEL1
             MOVE 'F' TO VISIBLE OF FRAME1
             MOVE 'F' TO SPA-VISIBLE
           ELSE
             DISPLAY 'false'
             MOVE 'T' TO VISIBLE OF NUMBERENTRY1
             MOVE 'T' TO VISIBLE OF PANDAENTRY1
             MOVE 'T' TO VISIBLE OF PANDATEXT1
             MOVE 'T' TO VISIBLE OF PANDACOMBO1
             MOVE 'T' TO VISIBLE OF BUTTON1
             MOVE 'T' TO VISIBLE OF LABEL1
             MOVE 'T' TO VISIBLE OF FRAME1
             MOVE 'T' TO SPA-VISIBLE
           END-IF.

           MOVE   'testvisible' TO  MCP-WINDOW.
           DISPLAY 'event end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
           EXIT.
