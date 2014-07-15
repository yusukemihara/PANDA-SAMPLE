       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         WINDOW1.
       ENVIRONMENT         DIVISION.
       CONFIGURATION           SECTION.
       DATA                DIVISION.
       WORKING-STORAGE         SECTION.
            COPY    "DB-SHELL".
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

           DISPLAY '================'.
           INITIALIZE DB-SHELL.

           MOVE 'SHELL' TO MCP-FUNC
           MOVE 'shell' TO MCP-TABLE
           MOVE 'command' TO MCP-PATHNAME
           MOVE '/usr/lib/panda/bin/monupload' TO DB-SHELL-NAME

           EVALUATE MCP-WIDGET
           WHEN 'button1'
             MOVE '-t' TO DB-SHELL-ARG1
             MOVE 'report' TO DB-SHELL-ARG2
             MOVE '-s' TO DB-SHELL-ARG3
             MOVE '-T' TO DB-SHELL-ARG4
             MOVE 'hoge' TO DB-SHELL-ARG5
             MOVE 'cobol/a.pdf' TO DB-SHELL-ARG6
           WHEN 'button2'
             MOVE '-t' TO DB-SHELL-ARG1
             MOVE 'report' TO DB-SHELL-ARG2
             MOVE '-p' TO DB-SHELL-ARG3
             MOVE 'PDF' TO DB-SHELL-ARG4
             MOVE '-T' TO DB-SHELL-ARG5
             MOVE 'hoge' TO DB-SHELL-ARG6
             MOVE 'cobol/b.pdf' TO DB-SHELL-ARG7
           WHEN 'button3'
             MOVE '-t' TO DB-SHELL-ARG1
             MOVE 'misc' TO DB-SHELL-ARG2
             MOVE '-f' TO DB-SHELL-ARG3
             MOVE 'c.txt' TO DB-SHELL-ARG4
             MOVE '-d' TO DB-SHELL-ARG5
             MOVE 'test' TO DB-SHELL-ARG6
             MOVE 'cobol/c.txt' TO DB-SHELL-ARG7
           END-EVALUATE.

           CALL 'MONFUNC' USING
             MCPAREA
             DB-SHELL.

           MOVE 'window1' TO  MCP-WINDOW.
           MOVE 'PUTG' TO MCP-PUTTYPE.

           DISPLAY 'window1 event end'.
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE 'PUTWINDOW' TO MCP-FUNC.
           CALL 'MONFUNC' USING
             MCPAREA.
           EXIT.
