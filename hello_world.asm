; Hello World written in Intel syntax

%include 'functions.asm'


SECTION .data
msg1 db 'Hello, World from assembly!', 0h
  msg2 db 'These are printed via our little string print library', 0h

SECTION .text
global _start

_start:

  mov eax, msg1
  call sprintlf

  mov eax, msg2
  call sprintlf

  call quit
