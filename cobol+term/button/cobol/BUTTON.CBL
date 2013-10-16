       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         BUTTON.
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
      **************************************************************************
       PROCEDURE           DIVISION    USING
           MCPAREA
           SPAAREA
           LINKAREA
           SCRAREA.
       000-MAIN                SECTION.
           EVALUATE    MCP-STATUS      ALSO    MCP-EVENT
             WHEN     'LINK'           ALSO    ANY
               PERFORM 010-INIT
             WHEN     'PUTG'           ALSO    'toggled'
               PERFORM  700-TOGGLED
             WHEN     'PUTG'           ALSO    'clicked'
               PERFORM  800-CLICKED
           END-EVALUATE.
           EXIT    PROGRAM.
      **************************************************************************
       010-INIT                SECTION.
           DISPLAY 'init'
           MOVE    'label1'    TO  LB1TEXT.
           MOVE   'NEW'        TO  MCP-PUTTYPE.
           MOVE   'button'     TO  MCP-WINDOW.
           PERFORM 900-PUT-WINDOW.
      **************************************************************************
       700-TOGGLED             SECTION.
           DISPLAY 'toggled'
           DISPLAY BT3BOOL
           IF      BT1BOOL     =   'F'
           MOVE    'red'       TO  BT1STYLE 
           MOVE    'red'       TO  LB1STYLE 
           MOVE    'red'       TO  LB1TEXT 
           MOVE    'T'         TO  BT1BOOL
           DISPLAY 'IF-END'
           DISPLAY BT3BOOL
           ELSE
           MOVE    'blue'      TO  BT1STYLE 
           MOVE    'blue'      TO  LB1STYLE 
           MOVE    'blue'      TO  LB1TEXT 
           MOVE    'F'         TO  BT1BOOL
           DISPLAY 'ELSE-END'
           DISPLAY BT3BOOL
           END-IF
           PERFORM 900-PUT-WINDOW.
      **************************************************************************
       800-CLICKED             SECTION.
           DISPLAY 'clicked'
           MOVE    'green'      TO  BT1STYLE 
           PERFORM 900-PUT-WINDOW.
      **************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MCPSUB'     USING
                MCPAREA.
