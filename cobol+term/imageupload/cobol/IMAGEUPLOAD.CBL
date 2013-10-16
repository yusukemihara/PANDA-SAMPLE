       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         IMAGEUPLOAD.
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
             WHEN     'PUTG'           ALSO    'CLICKED'
               PERFORM  700-CLICKED
           END-EVALUATE.
           EXIT    PROGRAM.
      **************************************************************************
       010-INIT                SECTION.
           MOVE   'BLOBIMPORT' TO  MCP-FUNC.
           MOVE   PATH-WORK-PRIMARY
        		       TO  MCP-PATH.
           MOVE   './cobol/demo.png'
                               TO  DB-WORK-FILE.
           CALL   'MCPSUB'     USING
                MCPAREA
                DB-WORK.
           MOVE   LOW-VALUE
                               TO  UPDATA.
           MOVE   ALL SPACE
                               TO  FILENAME.
           MOVE   DB-WORK-OBJECT
                               TO  DOWNDATA.
           MOVE   'NEW'        TO  MCP-PUTTYPE.
           MOVE   'imageupload'    
                               TO  MCP-WINDOW.
           PERFORM 900-PUT-WINDOW.
      **************************************************************************
       700-CLICKED             SECTION.
           DISPLAY                 UPDATA.
           DISPLAY                 FILENAME.
           MOVE   UPDATA
                               TO  DB-WORK-OBJECT.
           MOVE   'BLOBEXPORT' TO  MCP-FUNC.
           MOVE   PATH-WORK-PRIMARY
                       TO MCP-PATH.
           MOVE   './cobol/uploaded.png'
                               TO  DB-WORK-FILE.
           CALL   'MCPSUB'     USING
                MCPAREA
                DB-WORK.
           MOVE   UPDATA
                               TO  DOWNDATA.
           MOVE   LOW-VALUE
                               TO  UPDATA.
      *     MOVE   ALL SPACE
      *                         TO  FILENAME.
           PERFORM 900-PUT-WINDOW.
      **************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MCPSUB'     USING
                MCPAREA.
