       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         WINDOW1.
       ENVIRONMENT         DIVISION.
       CONFIGURATION           SECTION.
       DATA                DIVISION.
       WORKING-STORAGE         SECTION.
       01  ENVVAL  PIC X(64).
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
               PERFORM  200-EVENT
           END-EVALUATE.
           EXIT    PROGRAM.
      *
      ************************************************************************
       100-INIT                SECTION.
           DISPLAY 'window1 init'
           INITIALIZE SCRAREA.
           MOVE 'window1' TO MCP-WINDOW.
           MOVE 'NEW' TO MCP-PUTTYPE.

           DISPLAY 'window1 init end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       200-EVENT SECTION.
           DISPLAY 'window1 event'.

           MOVE 'window1' TO  MCP-WINDOW.
           MOVE 'PUTG' TO MCP-PUTTYPE.

           DISPLAY '================'.

           ACCEPT ENVVAL FROM ENVIRONMENT 'MCP_DC_TERM'.
           DISPLAY 'term: ' ENVVAL.

           ACCEPT ENVVAL FROM ENVIRONMENT 'MCP_DC_HOST'.
           DISPLAY 'host: ' ENVVAL.

           ACCEPT ENVVAL FROM ENVIRONMENT 'MCP_DC_TENANT'.
           DISPLAY 'tenant: ' ENVVAL.

           ACCEPT ENVVAL FROM ENVIRONMENT 'MCP_DC_TEMPDIR'.
           DISPLAY 'tempdir: ' ENVVAL.

           ACCEPT ENVVAL FROM ENVIRONMENT 'MCP_DC_USER'.
           DISPLAY 'user: ' ENVVAL.

           ACCEPT ENVVAL FROM ENVIRONMENT 'MCP_DC_WINDOW'.
           DISPLAY 'window: ' ENVVAL.

           ACCEPT ENVVAL FROM ENVIRONMENT 'MCP_DC_WIDGET'.
           DISPLAY 'widget: ' ENVVAL.

           ACCEPT ENVVAL FROM ENVIRONMENT 'MCP_DC_EVENT'.
           DISPLAY 'event: ' ENVVAL.

           DISPLAY 'window1 event end'.
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
           EXIT.
