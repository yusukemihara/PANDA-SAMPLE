       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         DOWNLOAD.
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
           DISPLAY "mcpstatsu:" MCP-STATUS
           DISPLAY "mcpwidget:" MCP-WIDGET
           EVALUATE    MCP-STATUS      ALSO    MCP-WIDGET
             WHEN     'LINK'           ALSO    ANY
               PERFORM  010-INIT
             WHEN     'PUTG'           ALSO    'button1'
               PERFORM  100-CLICKED
             WHEN     'PUTG'           ALSO    'button2'
               PERFORM  200-CLICKED
             WHEN     'PUTG'           ALSO    'button3'
               PERFORM  300-CLICKED
             WHEN     OTHER
               PERFORM  400-CLICKED
           END-EVALUATE.
           EXIT    PROGRAM.
      ************************************************************************
       010-INIT                SECTION.
           DISPLAY '010-init'
           MOVE   LOW-VALUE    TO  OBJECTDATA.
           MOVE   ''           TO  FILENAME.
           MOVE   'NEW'        TO  MCP-PUTTYPE.
           MOVE   'download'   TO  MCP-WINDOW.
           PERFORM 900-PUT-WINDOW.
       010-INIT-END.
           EXIT.
      ************************************************************************
       100-CLICKED                SECTION.
           DISPLAY '100-clicked'
           MOVE   'BLOBIMPORT' TO  MCP-FUNC.
           MOVE   'work'       TO  MCP-TABLE.
           MOVE   'key'        TO  MCP-PATHNAME.
           MOVE   './cobol/a.odt' TO  DB-WORK-FILE.
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-WORK.
           MOVE   DB-WORK-OBJECT TO  OBJECTDATA.
           MOVE   'a.odt' TO FILENAME.
           PERFORM 900-PUT-WINDOW.
       100-CLICKED-END.
           EXIT.
      ************************************************************************
       200-CLICKED                SECTION.
           DISPLAY '200-clicked'
           MOVE   'BLOBIMPORT' TO  MCP-FUNC.
           MOVE   'work'       TO  MCP-TABLE.
           MOVE   'key'        TO  MCP-PATHNAME.
           MOVE   './cobol/b.png' TO  DB-WORK-FILE.
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-WORK.
           MOVE   DB-WORK-OBJECT TO  OBJECTDATA.
           MOVE   'b.png' TO FILENAME.
           PERFORM 900-PUT-WINDOW.
       200-CLICKED-END.
           EXIT.
      ************************************************************************
       300-CLICKED                SECTION.
           DISPLAY '300-clicked'
           MOVE   'BLOBIMPORT' TO  MCP-FUNC.
           MOVE   'work'       TO  MCP-TABLE.
           MOVE   'key'        TO  MCP-PATHNAME.
           MOVE   './cobol/c.txt' TO  DB-WORK-FILE.
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-WORK.
           MOVE   DB-WORK-OBJECT TO  OBJECTDATA.
           MOVE   'c.txt' TO FILENAME.
           PERFORM 900-PUT-WINDOW.
       300-CLICKED-END.
           EXIT.
      ************************************************************************
       400-CLICKED                SECTION.
           DISPLAY '400-clicked'.
       400-CLICKED-END.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
       900-PUT-WINDOW-END.
           EXIT.
