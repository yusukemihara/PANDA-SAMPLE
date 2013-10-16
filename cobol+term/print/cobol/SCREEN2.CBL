       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         SCREEN2.
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
           END-EVALUATE.
           EXIT    PROGRAM.
      ************************************************************************
       010-INIT                SECTION.
           DISPLAY '010-init'
           MOVE   'NEW'        TO  MCP-PUTTYPE.
           MOVE   'screen2'    TO  MCP-WINDOW.
           PERFORM 900-PUT-WINDOW.
       010-INIT-END.
           EXIT.
      ************************************************************************
       100-SWITCH              SECTION.
           DISPLAY '100-switch'
           MOVE   'CHANGE'      TO  MCP-PUTTYPE.
           MOVE   'screen1'     TO  MCP-WINDOW.
           PERFORM 900-PUT-WINDOW.
       100-CLICKED-END.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
       900-PUT-WINDOW-END.
           EXIT.
