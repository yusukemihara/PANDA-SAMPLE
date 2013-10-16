       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         SCREEN1.
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
           MOVE   'screen1'    TO  MCP-WINDOW.
           MOVE  0 TO SPA-NUM.
           PERFORM 900-PUT-WINDOW.
       010-INIT-END.
           EXIT.
      ************************************************************************
       200-CLICKED                SECTION.
           DISPLAY '200-clicked'
           INITIALIZE P1.
           EVALUATE    MCP-WIDGET
             WHEN   'b1'
               MOVE '1.pdf' TO TITLE  OF ITEM (1)
               MOVE 'print47/print?filename=1.pdf' TO PATH OF ITEM (1)
               MOVE 1 TO SHOWDIALOG(1)
               MOVE '2.pdf' TO TITLE  OF ITEM (2)
               MOVE 'print47/print?filename=1.pdf' TO PATH  OF ITEM (2)
               MOVE 1 TO SHOWDIALOG(2)
               MOVE '3.pdf' TO TITLE  OF ITEM (3)
               MOVE 'print47/print?filename=1.pdf' TO PATH  OF ITEM (3)
               MOVE 1 TO SHOWDIALOG(3)
             WHEN   'b2'
               MOVE '2.pdf' TO TITLE OF ITEM (1)
               MOVE 'print47/print?filename=2.pdf' TO PATH OF ITEM (1)
               MOVE 1 TO NRETRY(1)
               MOVE 1 TO SHOWDIALOG(1)
             WHEN   'b3'
               MOVE '3.pdf' TO TITLE OF ITEM (1) 
               MOVE 'print47/print?filename=3.pdf' TO PATH OF ITEM (1) 
             WHEN   'b4'
               MOVE '1.pdf' TO TITLE  OF ITEM (1)
               MOVE 'print47/print?filename=1.pdf' TO PATH  OF ITEM (1)
               MOVE '2.pdf' TO TITLE  OF ITEM (2)
               MOVE 'print47/print?filename=2.pdf' TO PATH  OF ITEM (2)
               MOVE '3.pdf' TO TITLE  OF ITEM (3)
               MOVE 'print47/print?filename=3.pdf' TO PATH  OF ITEM (3)
           END-EVALUATE.
           MOVE   ''            TO  MCP-PUTTYPE.
           MOVE   'screen1'     TO  MCP-WINDOW.
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
