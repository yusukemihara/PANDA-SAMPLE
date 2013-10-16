      * 日本語いーゆーしーじぇぴー
       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         CLIST.
       ENVIRONMENT         DIVISION.
       CONFIGURATION           SECTION.
       DATA                DIVISION.
       WORKING-STORAGE         SECTION.
       01  CNT      PIC 9(5) VALUE 1.
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
               PERFORM  700-EVENT
           END-EVALUATE.
           EXIT    PROGRAM.
      *
      ************************************************************************
       100-INIT                SECTION.
           DISPLAY 'init'
           INITIALIZE SCRAREA.
           MOVE   'clist' TO  MCP-WINDOW.

           MOVE 1 TO CNT.
           PERFORM UNTIL CNT > 100
             MOVE  CNT  TO VALUE0(CNT)
             MOVE  CNT  TO VALUE1(CNT)
             MOVE  CNT  TO VALUE2(CNT)
             ADD 1 TO CNT
           END-PERFORM.

           MOVE 50 TO ROW1.
           MOVE 0 TO ROWATTR1.
           MOVE 100 TO COUNT1.

           DISPLAY 'init end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       700-EVENT             SECTION.
           DISPLAY 'event'.
           DISPLAY 'event end'
           MOVE 1 TO CNT.
           PERFORM UNTIL CNT > 100
             IF SELECT1(CNT) = 'T'
               MOVE CNT TO ROW1
             END-IF
             ADD 1 TO CNT
           END-PERFORM.

           DISPLAY ROW1
           MOVE   'clist' TO  MCP-WINDOW.
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
           EXIT.
