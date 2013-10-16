       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         LIST.
       ENVIRONMENT         DIVISION.
       CONFIGURATION       SECTION.
       INPUT-OUTPUT         SECTION.
       FILE-CONTROL.
           SELECT FD1 ASSIGN TO "./cobol/data" 
                            FILE STATUS IS DATA-FILE-ST.
       DATA                DIVISION.
       FILE                SECTION.
       FD  FD1.
            COPY    "DB-XML" REPLACING
                             //DB-XML// BY //DATA-FILE//.
       WORKING-STORAGE     SECTION.
       01  DATA-FILE-ST    PIC X(02).
       01  CNT             PIC 9(5) VALUE 0.
       01  MAX             PIC 9(5) VALUE 0.

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
           DISPLAY  SCR-METHODTYPE
           EVALUATE    SCR-METHODTYPE 
             WHEN     'GET'
               PERFORM 010-GET
             WHEN     'POST'
               PERFORM 020-POST
           END-EVALUATE.
           EXIT    PROGRAM.
      ************************************************************************
       010-GET                SECTION.
           DISPLAY '010-GET start' 

           DISPLAY SCR-BODY

           MOVE  LOW-VALUE     TO SCR-BODY
           MOVE  SCR-MAX       TO MAX

           OPEN INPUT FD1.
           IF DATA-FILE-ST NOT = "00"
                DISPLAY 'cannot open data-file' 
                EXIT
           END-IF.

           MOVE   'XMLOPEN' TO  MCP-FUNC.
           MOVE   'xml'       TO  MCP-TABLE.
           MOVE   'key'        TO  MCP-PATHNAME.
           MOVE   1         TO  DB-XML-MODE.
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-XML.
           IF (MCP-RC = ZERO OR 1)
               DISPLAY 'XMLOPEN end' 
               CONTINUE
           ELSE
               DISPLAY "XMLOPEN failure"
           END-IF.

           MOVE   1         TO  CNT.
           PERFORM UNTIL CNT > MAX
               READ FD1 RECORD
               IF DATA-FILE-ST = "00"
                 MOVE  DATA-FILE-CHAR1     TO   DB-XML-CHAR1
                 MOVE  DATA-FILE-VARCHAR1  TO   DB-XML-VARCHAR1
                 MOVE  DATA-FILE-INT1      TO   DB-XML-INT1
                 MOVE  DATA-FILE-BOOL1     TO   DB-XML-BOOL1
                 MOVE  DATA-FILE-NUMBER1   TO   DB-XML-NUMBER1
                 MOVE  DATA-FILE-ARRAY1(1) TO   DB-XML-ARRAY1(1)
                 MOVE  DATA-FILE-ARRAY1(2) TO   DB-XML-ARRAY1(2)
                 MOVE  DATA-FILE-ARRAY1(3) TO   DB-XML-ARRAY1(3)
                 MOVE   'XMLWRITE' TO  MCP-FUNC
                 MOVE   'xml'       TO  MCP-TABLE
                 MOVE   'key'        TO  MCP-PATHNAME
                 CALL   'MONFUNC'     USING
                      MCPAREA
                      DB-XML
               ELSE
                 COMPUTE CNT = MAX + 1
               END-IF
               ADD 1 TO CNT
           END-PERFORM.

           MOVE   'XMLCLOSE' TO  MCP-FUNC
           MOVE   'xml'       TO  MCP-TABLE
           MOVE   'key'        TO  MCP-PATHNAME
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-XML.
           IF (MCP-RC = ZERO OR 1)
               DISPLAY 'XMLCLOSE end' 
               CONTINUE
           ELSE
               DISPLAY "XMLCLOSE failure"
           END-IF.

           CLOSE FD1

           MOVE  DB-XML-OBJECT     TO SCR-BODY
           MOVE  'application/xml' TO SCR-CONTENT-TYPE
           EXIT.

      ************************************************************************
       020-POST               SECTION.
           DISPLAY '020-POST start' 
           DISPLAY SCR-BODY

           OPEN OUTPUT FD1.
           IF DATA-FILE-ST NOT = "00"
                DISPLAY 'cannot open data-file' 
                EXIT
           END-IF.
           DISPLAY 'open end' 

           MOVE   'XMLOPEN' TO  MCP-FUNC.
           MOVE   'xml'       TO  MCP-TABLE.
           MOVE   'key'        TO  MCP-PATHNAME.
           MOVE   SCR-BODY   TO  DB-XML-OBJECT.
           MOVE   0          TO  DB-XML-MODE.
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-XML.
           IF (MCP-RC = ZERO OR 1)
               CONTINUE
           ELSE
               DISPLAY "XMLOPEN failure"
           END-IF.
           DISPLAY 'XMLOPEN end' 

           MOVE ZERO TO  CNT.
           PERFORM UNTIL NOT CNT = ZERO
               DISPLAY 'xml read' 
               MOVE   'XMLREAD' TO  MCP-FUNC
               MOVE   'xml'       TO  MCP-TABLE
               MOVE   'key'        TO  MCP-PATHNAME
               CALL   'MONFUNC'     USING
                    MCPAREA
                    DB-XML
               IF (MCP-RC = ZERO OR 1)
                   CONTINUE
               ELSE
           DISPLAY 'xml read fail' 
                   MOVE  1 TO  CNT
           DISPLAY CNT
               END-IF
           DISPLAY 'xml readend' 
               MOVE  DB-XML-CHAR1     TO   DATA-FILE-CHAR1
               MOVE  DB-XML-VARCHAR1  TO   DATA-FILE-VARCHAR1
               MOVE  DB-XML-INT1      TO   DATA-FILE-INT1
               MOVE  DB-XML-BOOL1     TO   DATA-FILE-BOOL1
               MOVE  DB-XML-NUMBER1   TO   DATA-FILE-NUMBER1
               MOVE  DB-XML-ARRAY1(1) TO   DATA-FILE-ARRAY1(1)
               MOVE  DB-XML-ARRAY1(2) TO   DATA-FILE-ARRAY1(2)
               MOVE  DB-XML-ARRAY1(3) TO   DATA-FILE-ARRAY1(3)
              
               WRITE DATA-FILE
               IF DATA-FILE-ST = "00"
                 CONTINUE
               ELSE
                 DISPLAY 'write data-file failure'
               END-IF
           END-PERFORM.

           MOVE   'XMLCLOSE' TO  MCP-FUNC
           MOVE   'xml'       TO  MCP-TABLE
           MOVE   'key'        TO  MCP-PATHNAME
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-XML.
           IF (MCP-RC = ZERO OR 1)
               DISPLAY 'XMLCLOSE end' 
               CONTINUE
           ELSE
               DISPLAY "XMLCLOSE failure"
           END-IF.

           CLOSE FD1 
           MOVE  LOW-VALUE TO SCR-BODY

           EXIT.
