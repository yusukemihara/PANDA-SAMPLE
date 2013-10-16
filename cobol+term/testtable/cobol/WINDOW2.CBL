       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         WINDOW2.
       ENVIRONMENT         DIVISION.
       CONFIGURATION           SECTION.
       DATA                DIVISION.
       WORKING-STORAGE         SECTION.
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
           DISPLAY 'init window2'
           INITIALIZE WINDOW2.
           MOVE   'window2' TO  MCP-WINDOW.
           MOVE 'NEW' TO MCP-PUTTYPE.

           MOVE '01' TO V OF SRYKBN01.
           MOVE '02' TO V OF SRYKBN02.
           MOVE '03' TO V OF SRYKBN03.
           MOVE '04' TO V OF SRYKBN04.
           MOVE '05' TO V OF SRYKBN05.
           MOVE '06' TO V OF SRYKBN06.
           MOVE '07' TO V OF SRYKBN07.
           MOVE '08' TO V OF SRYKBN08.
           MOVE '09' TO V OF SRYKBN09.
           MOVE '10' TO V OF SRYKBN10.
           MOVE '11' TO V OF SRYKBN11.
           MOVE '12' TO V OF SRYKBN12.
           MOVE '13' TO V OF SRYKBN13.
           MOVE '14' TO V OF SRYKBN14.
           MOVE '15' TO V OF SRYKBN15.
           MOVE '16' TO V OF SRYKBN16.
           MOVE '17' TO V OF SRYKBN17.
           MOVE '18' TO V OF SRYKBN18.
           MOVE '19' TO V OF SRYKBN19.
           MOVE '20' TO V OF SRYKBN20.

           MOVE 'INPUTCD01' TO V OF INPUTCD01.
           MOVE 'INPUTCD02' TO V OF INPUTCD02.
           MOVE 'INPUTCD03' TO V OF INPUTCD03.
           MOVE 'INPUTCD04' TO V OF INPUTCD04.
           MOVE 'INPUTCD05' TO V OF INPUTCD05.
           MOVE 'INPUTCD06' TO V OF INPUTCD06.
           MOVE 'INPUTCD07' TO V OF INPUTCD07.
           MOVE 'INPUTCD08' TO V OF INPUTCD08.
           MOVE 'INPUTCD09' TO V OF INPUTCD09.
           MOVE 'INPUTCD10' TO V OF INPUTCD10.
           MOVE 'INPUTCD11' TO V OF INPUTCD11.
           MOVE 'INPUTCD12' TO V OF INPUTCD12.
           MOVE 'INPUTCD13' TO V OF INPUTCD13.
           MOVE 'INPUTCD14' TO V OF INPUTCD14.
           MOVE 'INPUTCD15' TO V OF INPUTCD15.
           MOVE 'INPUTCD16' TO V OF INPUTCD16.
           MOVE 'INPUTCD17' TO V OF INPUTCD17.
           MOVE 'INPUTCD18' TO V OF INPUTCD18.
           MOVE 'INPUTCD19' TO V OF INPUTCD19.
           MOVE 'INPUTCD20' TO V OF INPUTCD20.

           MOVE 'MEISYO01' TO V OF MEISYO01.
           MOVE 'MEISYO02' TO V OF MEISYO02.
           MOVE 'MEISYO03' TO V OF MEISYO03.
           MOVE 'MEISYO04' TO V OF MEISYO04.
           MOVE 'MEISYO05' TO V OF MEISYO05.
           MOVE 'MEISYO06' TO V OF MEISYO06.
           MOVE 'MEISYO07' TO V OF MEISYO07.
           MOVE 'MEISYO08' TO V OF MEISYO08.
           MOVE 'MEISYO09' TO V OF MEISYO09.
           MOVE 'MEISYO10' TO V OF MEISYO10.
           MOVE 'MEISYO11' TO V OF MEISYO11.
           MOVE 'MEISYO12' TO V OF MEISYO12.
           MOVE 'MEISYO13' TO V OF MEISYO13.
           MOVE 'MEISYO14' TO V OF MEISYO14.
           MOVE 'MEISYO15' TO V OF MEISYO15.
           MOVE 'MEISYO16' TO V OF MEISYO16.
           MOVE 'MEISYO17' TO V OF MEISYO17.
           MOVE 'MEISYO18' TO V OF MEISYO18.
           MOVE 'MEISYO19' TO V OF MEISYO19.
           MOVE 'MEISYO20' TO V OF MEISYO20.

           MOVE 'SURYO01' TO V OF SURYO01.
           MOVE 'SURYO02' TO V OF SURYO02.
           MOVE 'SURYO03' TO V OF SURYO03.
           MOVE 'SURYO04' TO V OF SURYO04.
           MOVE 'SURYO05' TO V OF SURYO05.
           MOVE 'SURYO06' TO V OF SURYO06.
           MOVE 'SURYO07' TO V OF SURYO07.
           MOVE 'SURYO08' TO V OF SURYO08.
           MOVE 'SURYO09' TO V OF SURYO09.
           MOVE 'SURYO10' TO V OF SURYO10.
           MOVE 'SURYO11' TO V OF SURYO11.
           MOVE 'SURYO12' TO V OF SURYO12.
           MOVE 'SURYO13' TO V OF SURYO13.
           MOVE 'SURYO14' TO V OF SURYO14.
           MOVE 'SURYO15' TO V OF SURYO15.
           MOVE 'SURYO16' TO V OF SURYO16.
           MOVE 'SURYO17' TO V OF SURYO17.
           MOVE 'SURYO18' TO V OF SURYO18.
           MOVE 'SURYO19' TO V OF SURYO19.
           MOVE 'SURYO20' TO V OF SURYO20.

           DISPLAY 'init window2 end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       700-EVENT             SECTION.
           DISPLAY 'event window2'.

           MOVE '01' TO V OF SRYKBN01.

           DISPLAY SRYKBN01.

           MOVE '02' TO V OF SRYKBN02.
           MOVE '03' TO V OF SRYKBN03.
           MOVE '04' TO V OF SRYKBN04.
           MOVE '05' TO V OF SRYKBN05.
           MOVE '06' TO V OF SRYKBN06.
           MOVE '07' TO V OF SRYKBN07.
           MOVE '08' TO V OF SRYKBN08.
           MOVE '09' TO V OF SRYKBN09.
           MOVE '10' TO V OF SRYKBN10.
           MOVE '11' TO V OF SRYKBN11.
           MOVE '12' TO V OF SRYKBN12.
           MOVE '13' TO V OF SRYKBN13.
           MOVE '14' TO V OF SRYKBN14.
           MOVE '15' TO V OF SRYKBN15.
           MOVE '16' TO V OF SRYKBN16.
           MOVE '17' TO V OF SRYKBN17.
           MOVE '18' TO V OF SRYKBN18.
           MOVE '19' TO V OF SRYKBN19.
           MOVE '20' TO V OF SRYKBN20.

           MOVE 'INPUTCD01' TO V OF INPUTCD01.
           MOVE 'INPUTCD02' TO V OF INPUTCD02.
           MOVE 'INPUTCD03' TO V OF INPUTCD03.
           MOVE 'INPUTCD04' TO V OF INPUTCD04.
           MOVE 'INPUTCD05' TO V OF INPUTCD05.
           MOVE 'INPUTCD06' TO V OF INPUTCD06.
           MOVE 'INPUTCD07' TO V OF INPUTCD07.
           MOVE 'INPUTCD08' TO V OF INPUTCD08.
           MOVE 'INPUTCD09' TO V OF INPUTCD09.
           MOVE 'INPUTCD10' TO V OF INPUTCD10.
           MOVE 'INPUTCD11' TO V OF INPUTCD11.
           MOVE 'INPUTCD12' TO V OF INPUTCD12.
           MOVE 'INPUTCD13' TO V OF INPUTCD13.
           MOVE 'INPUTCD14' TO V OF INPUTCD14.
           MOVE 'INPUTCD15' TO V OF INPUTCD15.
           MOVE 'INPUTCD16' TO V OF INPUTCD16.
           MOVE 'INPUTCD17' TO V OF INPUTCD17.
           MOVE 'INPUTCD18' TO V OF INPUTCD18.
           MOVE 'INPUTCD19' TO V OF INPUTCD19.
           MOVE 'INPUTCD20' TO V OF INPUTCD20.

           MOVE 'MEISYO01' TO V OF MEISYO01.
           MOVE 'MEISYO02' TO V OF MEISYO02.
           MOVE 'MEISYO03' TO V OF MEISYO03.
           MOVE 'MEISYO04' TO V OF MEISYO04.
           MOVE 'MEISYO05' TO V OF MEISYO05.
           MOVE 'MEISYO06' TO V OF MEISYO06.
           MOVE 'MEISYO07' TO V OF MEISYO07.
           MOVE 'MEISYO08' TO V OF MEISYO08.
           MOVE 'MEISYO09' TO V OF MEISYO09.
           MOVE 'MEISYO10' TO V OF MEISYO10.
           MOVE 'MEISYO11' TO V OF MEISYO11.
           MOVE 'MEISYO12' TO V OF MEISYO12.
           MOVE 'MEISYO13' TO V OF MEISYO13.
           MOVE 'MEISYO14' TO V OF MEISYO14.
           MOVE 'MEISYO15' TO V OF MEISYO15.
           MOVE 'MEISYO16' TO V OF MEISYO16.
           MOVE 'MEISYO17' TO V OF MEISYO17.
           MOVE 'MEISYO18' TO V OF MEISYO18.
           MOVE 'MEISYO19' TO V OF MEISYO19.
           MOVE 'MEISYO20' TO V OF MEISYO20.

           MOVE 'SURYO01' TO V OF SURYO01.
           MOVE 'SURYO02' TO V OF SURYO02.
           MOVE 'SURYO03' TO V OF SURYO03.
           MOVE 'SURYO04' TO V OF SURYO04.
           MOVE 'SURYO05' TO V OF SURYO05.
           MOVE 'SURYO06' TO V OF SURYO06.
           MOVE 'SURYO07' TO V OF SURYO07.
           MOVE 'SURYO08' TO V OF SURYO08.
           MOVE 'SURYO09' TO V OF SURYO09.
           MOVE 'SURYO10' TO V OF SURYO10.
           MOVE 'SURYO11' TO V OF SURYO11.
           MOVE 'SURYO12' TO V OF SURYO12.
           MOVE 'SURYO13' TO V OF SURYO13.
           MOVE 'SURYO14' TO V OF SURYO14.
           MOVE 'SURYO15' TO V OF SURYO15.
           MOVE 'SURYO16' TO V OF SURYO16.
           MOVE 'SURYO17' TO V OF SURYO17.
           MOVE 'SURYO18' TO V OF SURYO18.
           MOVE 'SURYO19' TO V OF SURYO19.
           MOVE 'SURYO20' TO V OF SURYO20.
           MOVE   'window1' TO  MCP-WINDOW.
           MOVE 'CHANGE' TO MCP-PUTTYPE.
           DISPLAY 'event window2 end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
           EXIT.
