       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         XMLIO.
       ENVIRONMENT         DIVISION.
       CONFIGURATION       SECTION.
       DATA                DIVISION.
       WORKING-STORAGE     SECTION.
       01  CNT             PIC 9(5) VALUE 0.
       01  FLT             PIC 999.999 VALUE 0.
            COPY    "DB-PATH".
            COPY    "DB-WORK".
            COPY    "DB-XML".
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
           END-EVALUATE.
           EXIT    PROGRAM.
      ************************************************************************
       010-INIT                SECTION.
 
           DISPLAY '010-INIT start' 

      * READ XML and OUTPUT window
           MOVE   'BLOBIMPORT' TO  MCP-FUNC.
           MOVE   'work'       TO  MCP-TABLE.
           MOVE   'key'        TO  MCP-PATHNAME.
           MOVE   './cobol/input.xml' TO DB-WORK-FILE.
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-WORK.
           IF (MCP-RC = ZERO OR 1)
               CONTINUE
           ELSE
               DISPLAY "BLOBIMPORT failure"
               PERFORM 900-PUT-WINDOW
           END-IF.
           DISPLAY 'BLOBIMPORT end' 

           MOVE   'XMLOPEN' TO  MCP-FUNC.
           MOVE   'xml'       TO  MCP-TABLE.
           MOVE   'key'        TO  MCP-PATHNAME.
           MOVE   DB-WORK-OBJECT TO DB-XML-OBJECT.
           MOVE   ZERO         TO  DB-XML-MODE.
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-XML.
           IF (MCP-RC = ZERO OR 1)
               CONTINUE
           ELSE
               DISPLAY "XMLOPEN failure"
               PERFORM 900-PUT-WINDOW
           END-IF.
           DISPLAY 'XMLOPEN end' 

           MOVE   1         TO  CNT.
           PERFORM UNTIL CNT > 10
               MOVE   'XMLREAD' TO  MCP-FUNC
               MOVE   'xml'       TO  MCP-TABLE
               MOVE   'key'        TO  MCP-PATHNAME
               CALL   'MONFUNC'     USING
                    MCPAREA
                    DB-XML
               DISPLAY CNT
               IF (MCP-RC = ZERO OR 1)
                   MOVE DB-XML-CHAR1      TO SCR-VALUE0(CNT)
                   MOVE DB-XML-VARCHAR1   TO SCR-VALUE1(CNT) 
                   MOVE DB-XML-INT1       TO SCR-VALUE2(CNT)
                   MOVE DB-XML-NUMBER1    TO SCR-VALUE3(CNT)
                   MOVE DB-XML-BOOL1      TO SCR-VALUE4(CNT)
                   MOVE DB-XML-ARRAY1(1)  TO SCR-VALUE5(CNT)
                   MOVE DB-XML-ARRAY1(2)  TO SCR-VALUE6(CNT)
                   MOVE DB-XML-ARRAY1(3)  TO SCR-VALUE7(CNT)
               ELSE
                   DISPLAY "XMLREAD failure"
               END-IF
               MOVE CNT TO SCR-COUNT
      *         MOVE CNT TO ROW1
      *         MOVE CNT TO ROWATTR1
               ADD 1 TO CNT
           END-PERFORM

           MOVE   'XMLCLOSE' TO  MCP-FUNC
           MOVE   'xml'       TO  MCP-TABLE
           MOVE   'key'        TO  MCP-PATHNAME
           MOVE   DB-WORK-OBJECT TO DB-XML-OBJECT
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-XML.
           IF (MCP-RC = ZERO OR 1)
               CONTINUE
           END-IF.

      ***********
      * WRITE XML
      ***********
           MOVE   'XMLOPEN' TO  MCP-FUNC.
           MOVE   'xml'       TO  MCP-TABLE.
           MOVE   'key'        TO  MCP-PATHNAME.
           MOVE   1         TO  DB-XML-MODE.
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-XML.
           IF (MCP-RC = ZERO OR 1)
               CONTINUE
           ELSE
               DISPLAY "XMLOPEN failure"
               PERFORM 900-PUT-WINDOW
           END-IF.
           DISPLAY 'XMLOPEN end' 

           MOVE   1         TO  CNT.
           PERFORM UNTIL CNT > 10
               MOVE    "キャラクタ"                 TO DB-XML-CHAR1
               MOVE    "ヴァーチャルキャラクタ"     TO DB-XML-VARCHAR1
               MOVE    CNT                          TO DB-XML-INT1
               MOVE    'T'                          TO DB-XML-BOOL1 
      *         COMPUTE       DB-XML-FLOAT1 = 100.0 / CNT
               MOVE    123.456789                   TO DB-XML-NUMBER1 
               COMPUTE       DB-XML-ARRAY1(1) = CNT * 1
               COMPUTE       DB-XML-ARRAY1(2) = CNT * 2
               COMPUTE       DB-XML-ARRAY1(3) = CNT * 3

               MOVE   'XMLWRITE' TO  MCP-FUNC
               MOVE   'xml'       TO  MCP-TABLE
               MOVE   'key'        TO  MCP-PATHNAME
               CALL   'MONFUNC'     USING
                    MCPAREA
                    DB-XML
               ADD 1 TO CNT
           END-PERFORM

           DISPLAY 'before XMLCLOSE' 
           DISPLAY DB-WORK-OBJECT

           MOVE   'XMLCLOSE' TO  MCP-FUNC.
           MOVE   'xml'       TO  MCP-TABLE.
           MOVE   'key'        TO  MCP-PATHNAME.
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-XML.
           IF (MCP-RC = ZERO OR 1)
               CONTINUE
           END-IF.

           MOVE   'BLOBEXPORT' TO  MCP-FUNC.
           MOVE   'work'       TO  MCP-TABLE.
           MOVE   'key'        TO  MCP-PATHNAME.
           MOVE   './cobol/output.xml' TO DB-WORK-FILE.
           MOVE   DB-XML-OBJECT TO DB-WORK-OBJECT.
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-WORK.
           IF (MCP-RC = ZERO OR 1)
               CONTINUE
           ELSE
               DISPLAY "BLOBEXPORT failure"
           END-IF.

           MOVE   SPACE        TO  MCP-PUTTYPE.
           MOVE   'xmlio'      TO  MCP-WINDOW.
           PERFORM 900-PUT-WINDOW.

      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MCPSUB'     USING
                MCPAREA.
