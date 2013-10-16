       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         WINDOWTITLE.
       ENVIRONMENT         DIVISION.
       CONFIGURATION           SECTION.
       DATA                DIVISION.
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
             WHEN     'PUTG'           ALSO    'CLICKED'
               PERFORM  800-CLICKED
           END-EVALUATE.
           EXIT    PROGRAM.
      **************************************************************************
       010-INIT                SECTION.
           DISPLAY 'init'
           MOVE   'NEW'        TO  MCP-PUTTYPE.
           MOVE   'windowtitle'     TO  MCP-WINDOW.
           MOVE   'test'       TO  EVALUE.
           PERFORM 900-PUT-WINDOW.
      **************************************************************************
       800-CLICKED             SECTION.
           DISPLAY 'CLICKED'
           DISPLAY EVALUE
           MOVE    EVALUE TO TITLE.
           DISPLAY TITLE
           PERFORM 900-PUT-WINDOW.
      **************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MCPSUB'     USING
                MCPAREA.
