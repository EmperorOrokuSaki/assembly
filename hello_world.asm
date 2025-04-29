; Hello World written in Intel syntax

%include 'functions.asm'


SECTION .data
msg1 db 'Hello, World from assembly!', 0Ah
msg2 db 'These are printed via our little string print library', 0Ah

SECTION .text
global _start

_start:

  mov eax, msg1
  call sprint

  mov eax, msg2
  call sprint

  call quit
