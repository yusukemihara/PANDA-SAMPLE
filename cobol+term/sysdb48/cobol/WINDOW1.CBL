       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         WINDOW1.
       ENVIRONMENT         DIVISION.
       CONFIGURATION           SECTION.
       DATA                DIVISION.
       WORKING-STORAGE         SECTION.
       01  CNT   PIC S9(9)   BINARY.
            COPY    "DB-SYS".
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
           DISPLAY 'init'
           INITIALIZE SCRAREA.
           INITIALIZE DB-SYS.
           MOVE   'window1' TO  MCP-WINDOW.

           PERFORM 150-UPDATE-CLIST.

           DISPLAY 'init end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       150-UPDATE-CLIST                SECTION.
           DISPLAY 'term:' MCP-TERM.
           MOVE 'SELECTALL' TO MCP-FUNC.
           MOVE 'system' TO MCP-TABLE.
           MOVE 'key' TO MCP-PATHNAME.
           CALL 'MONFUNC' USING 
             MCPAREA
             DB-SYS.
           MOVE 0 TO COUNT1.
           PERFORM WITH TEST AFTER UNTIL (MCP-RC NOT = ZERO)
             MOVE 'FETCH' TO MCP-FUNC
             CALL 'MONFUNC' USING 
               MCPAREA
               DB-SYS
             IF (MCP-RC = ZERO)
               ADD 1 TO COUNT1
               MOVE DB-SYS-ID TO VALUE0(COUNT1)
               MOVE DB-SYS-USER TO VALUE1(COUNT1)
               MOVE DB-SYS-HOST TO VALUE2(COUNT1)
               MOVE DB-SYS-AGENT TO VALUE3(COUNT1)
               MOVE DB-SYS-WINDOW TO VALUE4(COUNT1)
               MOVE DB-SYS-WIDGET TO VALUE5(COUNT1)
               MOVE DB-SYS-EVENT TO VALUE6(COUNT1)
               MOVE DB-SYS-IN-PROCESS TO VALUE7(COUNT1)
               MOVE DB-SYS-CREATE-TIME TO VALUE8(COUNT1)
               MOVE DB-SYS-ACCESS-TIME TO VALUE9(COUNT1)
               MOVE DB-SYS-PROCESS-TIME TO VALUE10(COUNT1)
               MOVE DB-SYS-TOTAL-PROCESS-TIME TO VALUE11(COUNT1)
               MOVE DB-SYS-COUNT TO VALUE12(COUNT1)
               MOVE DB-SYS-POPUP TO VALUE13(COUNT1)
               MOVE DB-SYS-DIALOG TO VALUE14(COUNT1)
               MOVE DB-SYS-ABORT TO VALUE15(COUNT1)
             END-IF
           END-PERFORM.
           DISPLAY 'count:' COUNT1.
           EXIT.
      ************************************************************************
       200-EVENT SECTION.
           DISPLAY 'event'.

           MOVE '' TO DB-SYS-POPUP.
           MOVE '' TO DB-SYS-DIALOG.
           MOVE '' TO DB-SYS-ABORT.

           MOVE ENTRY1 TO DB-SYS-ID.

           EVALUATE MCP-WIDGET
           WHEN 'bpopup'
             MOVE ENTRY2 TO DB-SYS-POPUP
             PERFORM 201-SET-MESSAGE
           WHEN 'bdialog'
             MOVE ENTRY2 TO DB-SYS-DIALOG
             PERFORM 201-SET-MESSAGE
           WHEN 'babort'
             MOVE ENTRY2 TO DB-SYS-ABORT
             PERFORM 201-SET-MESSAGE
           WHEN 'bpopupall'
             MOVE ENTRY2 TO DB-SYS-POPUP
             PERFORM 202-SET-MESSAGE-ALL
           WHEN 'bdialogall'
             MOVE ENTRY2 TO DB-SYS-DIALOG
             PERFORM 202-SET-MESSAGE-ALL
           WHEN 'babortall'
             MOVE ENTRY2 TO DB-SYS-ABORT
             PERFORM 202-SET-MESSAGE-ALL
           WHEN 'pandaclist1'
             PERFORM 203-SET-ID
           END-EVALUATE.

           PERFORM 150-UPDATE-CLIST.

           MOVE   'window1' TO  MCP-WINDOW.
           DISPLAY 'event end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       201-SET-MESSAGE SECTION.
           MOVE 'SETMESSAGE' TO MCP-FUNC.
           MOVE 'system' TO MCP-TABLE.
           CALL 'MONFUNC' USING 
             MCPAREA
             DB-SYS.
           EXIT.
      ************************************************************************
       202-SET-MESSAGE-ALL SECTION.
           MOVE 'SETMESSAGEALL' TO MCP-FUNC.
           MOVE 'system' TO MCP-TABLE.
           CALL 'MONFUNC' USING 
             MCPAREA
             DB-SYS.
           EXIT.
      ************************************************************************
       203-SET-ID SECTION.
           DISPLAY '203-set-id'
           MOVE 1 TO CNT.
           DISPLAY 'cnt:' CNT.
           DISPLAY 'count:' COUNT1.
           PERFORM UNTIL (CNT > COUNT1)
             DISPLAY 'select1:' SELECT1(CNT)
             IF (SELECT1(CNT) = 'T')
               DISPLAY 'value' CNT ':' VALUE0(CNT)
               MOVE VALUE0(CNT) TO ENTRY1
               ADD COUNT1 TO CNT
             END-IF
             ADD 1 TO CNT
           END-PERFORM.
           DISPLAY '203-set-id end'
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
           EXIT.
