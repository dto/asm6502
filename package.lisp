
(defpackage :6502-modes
  (:use)
  (:export :ABX :ABY :INDIRECT :RELATIVE :ZP :ZPX :ZPY :IDXI :INDI :IMM :MEM))

(defpackage :6502
  (:use)
  (:export :INY :ASL :PLP :STX :ORA :RTS :PLA :BVS :CPX :DEX :CLD :BCS :CMP :SEC :NOP
           :SBC :TSX :LDA :EOR :LSR :DEC :DEY :BNE :BEQ :INX :TXA :JMP :BRK :ANDA
           :BPL :INC :ROL :JSR :ROR :LDY :PHP :CLV :TXS :PHA :CPY :RTI :SED :TAX :SEI
           :TYA :BITA :CLC :BCC :STY :BMI :LDX :TAY :BVC :ADC :CLI :STA))

(defpackage :asm6502
  (:use :common-lisp :6502 :6502-modes)
  (:export #:msb #:lsb #:encode-byte #:encode-word
           #:promise :make-promise #:promise-name #:promise-fun #:delay #:force #:forcing
           #:binary-file
           #:context-emit #:context-address
           #:context-code-vector #:link
           #:context-find-label #:context-set-label
           #:*context* #:basic-context #:local-context
           #:emit #:label #:set-label #:advance-to #:align #:db #:dw #:rel #:*origin*
           #:opcode-cycles #:context-note-cycles #:counting-cycles #:local-context))

(defpackage :asm6502-utility
  (:use :common-lisp :6502 :6502-modes :asm6502)
  (:export #:+nmi-vector+ #:+reset-vector+ #:+irq-vector+ #:poke #:pokeword
           #:emit-delay #:timed-section
           #:asif #:condition-to-branch #:with-label #:as/until #:procedure))

(defpackage :asm6502-nes
  (:use :common-lisp :asm6502 :6502 :6502-modes :asm6502-utility)
  (:export
   #:+ntsc-clock-rate+
   #:+ppu-cr1+
   #:+ppu-cr2+
   #:+ppu-status+
   #:+spr-addr+
   #:+spr-io+
   #:+vram-scroll+
   #:+vram-addr+
   #:+vram-io+
   #:+pulse1-control+
   #:+pulse1-ramp+
   #:+pulse1-fine+
   #:+pulse1-coarse+
   #:+pulse2-control+
   #:+pulse2-ramp+
   #:+pulse2-fine+
   #:+pulse2-coarse+
   #:+tri-cr1+
   #:+tri-cr2+
   #:+tri-freq1+
   #:+tri-freq2+
   #:+noise-control+
   #:+noise-freq1+
   #:+noise-freq2+
   #:+dmc-control+
   #:+dmc-dac+
   #:+dmc-address+
   #:+dmc-length+
   #:+sprite-dma+
   #:+papu-control+
   #:+papu-irq-ctrl+
   #:+joypad-1+
   #:+joypad-2+
   #:ines-header
   #:write-ines
   #:ppuaddr
   #:ppuxy
   #:process-dac-waveform))
