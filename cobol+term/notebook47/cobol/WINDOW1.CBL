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
           EVALUATE    MCP-STATUS      ALSO    MCP-WIDGET
             WHEN     'LINK'           ALSO    ANY
               PERFORM  010-INIT
             WHEN     'PUTG'           ALSO    ANY
               PERFORM  200-EVENT
           END-EVALUATE.
           EXIT    PROGRAM.
      ************************************************************************
       010-INIT                SECTION.
           INITIALIZE SCRAREA
           DISPLAY '010-init'
           MOVE   'NEW'        TO  MCP-PUTTYPE.
           MOVE   'window1'    TO  MCP-WINDOW.
           MOVE 1 TO PAGENO.
           PERFORM 900-PUT-WINDOW.
       010-INIT-END.
           EXIT.
      ************************************************************************
       200-EVENT                SECTION.
           DISPLAY '200-event'
           MOVE   ''            TO  MCP-PUTTYPE.
           MOVE   'window1'     TO  MCP-WINDOW.
           EVALUATE    MCP-WIDGET
             WHEN     'b1'
               MOVE 1 TO PAGENO
             WHEN     'b2'
               MOVE 2 TO PAGENO
             WHEN     'b3'
               MOVE 0 TO PAGENO
             WHEN     'b4'
               MOVE 0 TO PAGENO
             WHEN     'b5'
               MOVE 1 TO PAGENO
             WHEN     'b6'
               MOVE 2 TO PAGENO
             WHEN     'notebook1'
               COMPUTE PAGENO = PAGENO + 1
               IF PAGENO = 3
                 MOVE 0 TO PAGENO
               END-IF
           END-EVALUATE.
           DISPLAY 'pageno:' PAGENO.
           DISPLAY 'widget:' MCP-WIDGET.
           DISPLAY '200-event end'
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
