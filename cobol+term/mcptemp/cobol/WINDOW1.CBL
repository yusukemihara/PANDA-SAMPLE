       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         WINDOW1.
       ENVIRONMENT         DIVISION.
       CONFIGURATION       SECTION.
       INPUT-OUTPUT        SECTION.
       FILE-CONTROL.
           SELECT FD1 ASSIGN TO DATA-FILE
                           FILE STATUS IS DATA-FILE-ST.

       DATA                DIVISION.
       FILE                SECTION.
           FD  FD1.
           01  DATA-VALUE      PIC X(2048).
       WORKING-STORAGE         SECTION.
           01  DATA-FILE       PIC X(2048).
           01  DATA-FILE-ST    PIC X(02).
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
               PERFORM  200-CLICKED
           END-EVALUATE.
           EXIT    PROGRAM.
      ************************************************************************
       010-INIT                SECTION.
           DISPLAY '010-init'
           DISPLAY MCP-TEMPDIR
           INITIALIZE SCRAREA
           MOVE   'NEW'        TO  MCP-PUTTYPE.
           MOVE   'window1'    TO  MCP-WINDOW.
           MOVE   ''           TO  VALUE1.
           PERFORM 900-PUT-WINDOW.
       010-INIT-END.
           EXIT.
      ************************************************************************
       200-CLICKED                SECTION.
           DISPLAY '200-clicked'
           DISPLAY VALUE1
           STRING MCP-TEMPDIR '/' VALUE1 
             DELIMITED BY ' '
             INTO DATA-FILE.
           DISPLAY DATA-FILE
           MOVE  VALUE1 TO DATA-VALUE.

           OPEN OUTPUT FD1.
           IF DATA-FILE-ST NOT = "00"
                DISPLAY 'cannot open data-file' 
                EXIT
           END-IF.
           DISPLAY 'open end' 

           WRITE DATA-VALUE
           IF DATA-FILE-ST = "00"
             CONTINUE
           ELSE
             DISPLAY 'write data-file failure'
           END-IF

           CLOSE FD1.

           MOVE   ''            TO  VALUE1.
           MOVE   ''            TO  MCP-PUTTYPE.
           MOVE   'window1'     TO  MCP-WINDOW.
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
