       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         SESSIONEND.
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
           DISPLAY   '==== SESSIONEND'
           DISPLAY   MCP-WINDOW
           DISPLAY   MCP-WIDGET
           DISPLAY   MCP-EVENT
           DISPLAY   MCP-TERM
           DISPLAY   MCP-USER
           EXIT    PROGRAM.
