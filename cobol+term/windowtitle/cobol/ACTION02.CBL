       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         ACTION02.
       ENVIRONMENT         DIVISION.
       CONFIGURATION           SECTION.
       DATA                DIVISION.
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
           DISPLAY MCP-WINDOW.
           MOVE   REQID        TO  RESID.
           MOVE   REQVAL02       TO  RESVAL02.
           EXIT    PROGRAM.
