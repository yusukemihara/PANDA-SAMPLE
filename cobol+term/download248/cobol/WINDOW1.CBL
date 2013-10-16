       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         WINDOW1.
       ENVIRONMENT         DIVISION.
       CONFIGURATION           SECTION.
       DATA                DIVISION.
       WORKING-STORAGE         SECTION.
            COPY    "DB-PATH".
            COPY    "DB-WORK".
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
           DISPLAY "mcpwidget:" MCP-WIDGET
           INITIALIZE SCRAREA
           EVALUATE    MCP-STATUS      ALSO    MCP-WIDGET
             WHEN     'LINK'           ALSO    ANY
               PERFORM  010-INIT
             WHEN     'PUTG'           ALSO    ANY
               PERFORM  200-CLICKED
           END-EVALUATE.
           EXIT    PROGRAM.
      ************************************************************************
       010-INIT                SECTION.
           DISPLAY '010-init'
           MOVE   'NEW'        TO  MCP-PUTTYPE.
           MOVE   'window1'    TO  MCP-WINDOW.
           MOVE  0 TO SPA-NUM.
           PERFORM 900-PUT-WINDOW.
       010-INIT-END.
           EXIT.
      ************************************************************************
       200-CLICKED                SECTION.
           DISPLAY '200-clicked'
           INITIALIZE D21.
           EVALUATE    MCP-WIDGET
             WHEN   'b1'
               MOVE 'download2/download2?arg=1.txt' TO PATH(1)
               MOVE '1.txt' TO FILENAME(1)
               MOVE 'text file 1' TO DESCRIPTION(1)
             WHEN   'b2'
               MOVE 'download2/download2?arg=2.txt' TO PATH(1)
               MOVE '2.txt' TO FILENAME(1)
               MOVE 'text file 2' TO DESCRIPTION(1)
             WHEN   'b3'
               MOVE 'download2/download2?arg=1.txt' TO PATH(1)
               MOVE '1.txt' TO FILENAME(1)
               MOVE 'text file 1' TO DESCRIPTION(1)
               MOVE 'download2/download2?arg=2.txt' TO PATH(2)
               MOVE '2.txt' TO FILENAME(2)
               MOVE 'text file 2' TO DESCRIPTION(2)
             WHEN   'b4'
               MOVE 'download2/download2?arg=none' TO PATH(1)
               MOVE 'none' TO FILENAME(1)
               MOVE 'none' TO DESCRIPTION(1)
               MOVE 5 TO NRETRY(1)
           END-EVALUATE.
           MOVE   ''            TO  MCP-PUTTYPE.
           MOVE   'window1'     TO  MCP-WINDOW.
           PERFORM 900-PUT-WINDOW.
       200-CLICKED-END.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
       900-PUT-WINDOW-END.
           EXIT.
