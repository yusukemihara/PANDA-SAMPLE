       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         REGISTBLOB.
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
           EVALUATE    MCP-STATUS      ALSO    MCP-EVENT
             WHEN     'LINK'           ALSO    ANY
               PERFORM 010-INIT
             WHEN     'PUTG'           ALSO    ANY
               PERFORM  700-CLICKED
           END-EVALUATE.
           EXIT    PROGRAM.
      ************************************************************************
       010-INIT                SECTION.
      * import and regist cat
           MOVE   'BLOBIMPORT' TO  MCP-FUNC.
           MOVE   PATH-WORK-PRIMARY
        		       TO  MCP-PATH.
           MOVE   './cobol/cat.jpg' TO  DB-WORK-FILE.
           CALL   'MCPSUB'     USING
                MCPAREA
                DB-WORK.
           MOVE   'BLOBREGISTER' TO  MCP-FUNC.
           MOVE   'cat' TO  DB-WORK-FILE.
           CALL   'MCPSUB'     USING
                MCPAREA
                DB-WORK.
      * set cat
           MOVE   DB-WORK-OBJECT TO  OID.
           MOVE   'cat' TO TITLE.

      * import and regist cow
           MOVE   'BLOBIMPORT' TO  MCP-FUNC.
           MOVE   './cobol/cow.jpg' TO  DB-WORK-FILE.
           CALL   'MCPSUB'     USING
                MCPAREA
                DB-WORK.
           MOVE   'BLOBREGISTER' TO  MCP-FUNC.
           MOVE   'cow'          TO  DB-WORK-FILE.
           CALL   'MCPSUB'     USING
                MCPAREA
                DB-WORK.

      * import and regist dog
           MOVE   'BLOBIMPORT' TO  MCP-FUNC.
           MOVE   './cobol/dog.jpg'  TO  DB-WORK-FILE.
           CALL   'MCPSUB'     USING
                MCPAREA
                DB-WORK.
           MOVE   'BLOBREGISTER' TO  MCP-FUNC.
           MOVE   'dog'          TO  DB-WORK-FILE.
           CALL   'MCPSUB'     USING
                MCPAREA
                DB-WORK.

           MOVE   'NEW'        TO  MCP-PUTTYPE.
           MOVE   'registblob'    
                               TO  MCP-WINDOW.
           PERFORM 900-PUT-WINDOW.
      ************************************************************************
       700-CLICKED             SECTION.
      * lookup BLOB
           MOVE   'BLOBLOOKUP' TO  MCP-FUNC.
           MOVE   TITLE TO  DB-WORK-FILE.
           CALL   'MCPSUB'     USING
                MCPAREA
                DB-WORK.

           IF DB-WORK-OBJECT = LOW-VALUE
           THEN
              PERFORM 800-SET-CAT
           END-IF.
           MOVE DB-WORK-OBJECT TO OID.    

           MOVE   'BLOBEXPORT' TO  MCP-FUNC.
           MOVE   './cobol/out.jpg' TO  DB-WORK-FILE.
           CALL   'MCPSUB'     USING
                MCPAREA
                DB-WORK.
           PERFORM 900-PUT-WINDOW.

      ************************************************************************
       800-SET-CAT          SECTION.
           MOVE   'BLOBLOOKUP' TO  MCP-FUNC.
           MOVE   'cat' TO  DB-WORK-FILE.
           CALL   'MCPSUB'     USING
                MCPAREA
                DB-WORK.
           MOVE   'cat' TO TITLE.

      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MCPSUB'     USING
                MCPAREA.
