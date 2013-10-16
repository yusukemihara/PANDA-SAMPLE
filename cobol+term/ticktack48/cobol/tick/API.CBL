       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         API.
       ENVIRONMENT         DIVISION.
       CONFIGURATION       SECTION.
       INPUT-OUTPUT         SECTION.
       DATA                DIVISION.
       FILE                SECTION.
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
           DISPLAY  MCP-STATUS
           DISPLAY  HTTP-METHOD
           EVALUATE    HTTP-METHOD 
             WHEN     'GET'
               PERFORM 010-GET
             WHEN     ANY
               PERFORM 020-ERROR
           END-EVALUATE.
           EXIT    PROGRAM.
      ************************************************************************
       010-GET                SECTION.
           DISPLAY '010-GET start' 
           MOVE LOW-VALUE TO BODY.
           DISPLAY 'hoge:' HOGE.
           DISPLAY 'mcp-user:' MCP-USER.
           MOVE 200 TO HTTP-STATUS
           EXIT.
      ************************************************************************
       020-ERROR                SECTION.
           DISPLAY '020-ERROR start' 
           MOVE 400 TO HTTP-STATUS. 
           EXIT.
