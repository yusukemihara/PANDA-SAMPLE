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
             WHEN     'PUTG'           ALSO    'button7'
               PERFORM  100-SWITCH
             WHEN     'PUTG'           ALSO    ANY
               PERFORM  200-CLICKED
           END-EVALUATE.
           EXIT    PROGRAM.
      ************************************************************************
       010-INIT                SECTION.
           DISPLAY '010-init'
           MOVE   'NEW'        TO  MCP-PUTTYPE.
           MOVE   'screen1'    TO  MCP-WINDOW.
           PERFORM 900-PUT-WINDOW.
       010-INIT-END.
           EXIT.
      ************************************************************************
       100-SWITCH              SECTION.
           DISPLAY '100-switch'
           MOVE   'CHANGE'      TO  MCP-PUTTYPE.
           MOVE   'screen2'     TO  MCP-WINDOW.
           PERFORM 900-PUT-WINDOW.
       100-CLICKED-END.
           EXIT.
      ************************************************************************
       200-CLICKED                SECTION.
           DISPLAY '200-clicked'
           INITIALIZE ITEM
           EVALUATE    MCP-WIDGET
             WHEN     'button1'
               MOVE '1.pdf' TO TITLE  OF ITEM (1)
               MOVE 'print/print?filename=1.pdf' TO PATH OF ITEM (1)
             WHEN   'button2'
               MOVE '2.pdf' TO TITLE OF ITEM (1)
               MOVE 'print/print?filename=2.pdf' TO PATH OF ITEM (1)
             WHEN   'button3'
               MOVE '3.pdf' TO TITLE OF ITEM (1) 
               MOVE 'print/print?filename=3.pdf' TO PATH OF ITEM (1) 
             WHEN   'button4'
               MOVE '1.ps' TO TITLE OF ITEM (1) 
               MOVE 'print/print?filename=1.ps' TO PATH OF ITEM (1) 
             WHEN   'button5'
               MOVE '2.ps' TO TITLE OF ITEM (1) 
               MOVE 'print/print?filename=2.ps' TO PATH OF ITEM (1) 
             WHEN   'button6'
               MOVE '3.ps' TO TITLE OF ITEM (1) 
               MOVE 'print/print?filename=3.ps' TO PATH OF ITEM (1) 
             WHEN   'button9'
               MOVE '1.pdf' TO TITLE  OF ITEM (1)
               MOVE 'print/print?filename=1.pdf' TO PATH  OF ITEM (1)
               MOVE '2.pdf' TO TITLE  OF ITEM (2)
               MOVE 'print/print?filename=2.pdf' TO PATH  OF ITEM (2)
               MOVE '3.pdf' TO TITLE  OF ITEM (3)
               MOVE 'print/print?filename=3.pdf' TO PATH  OF ITEM (3)
               MOVE '4.pdf' TO TITLE  OF ITEM (4)
               MOVE 'print/print?filename=4.pdf' TO PATH  OF ITEM (4)
               MOVE '5.pdf' TO TITLE  OF ITEM (5)
               MOVE 'print/print?filename=5.pdf' TO PATH  OF ITEM (5)
               MOVE '6.pdf' TO TITLE  OF ITEM (6)
               MOVE 'print/print?filename=6.pdf' TO PATH  OF ITEM (6)
             WHEN   'button10'
               MOVE '1.ps' TO TITLE  OF ITEM (1)
               MOVE 'print/print?filename=1.ps' TO PATH  OF ITEM (1)
               MOVE '2.ps' TO TITLE  OF ITEM (2)
               MOVE 'print/print?filename=2.ps' TO PATH  OF ITEM (2)
               MOVE '3.ps' TO TITLE  OF ITEM (3)
               MOVE 'print/print?filename=3.ps' TO PATH  OF ITEM (3)
               MOVE '4.ps' TO TITLE  OF ITEM (4)
               MOVE 'print/print?filename=4.ps' TO PATH  OF ITEM (4)
               MOVE '5.ps' TO TITLE  OF ITEM (5)
               MOVE 'print/print?filename=5.ps' TO PATH  OF ITEM (5)
               MOVE '6.ps' TO TITLE  OF ITEM (6)
               MOVE 'print/print?filename=6.ps' TO PATH  OF ITEM (6)
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
