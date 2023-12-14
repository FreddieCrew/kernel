section .text
extern idtp
global _load_idt
_load_idt:
    lidt [idtp]
    ret

global _gdt_flush
extern gp
_gdt_flush:
    lgdt [gp]
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    jmp 0x08:flush2
flush2:
    ret
global _isr0
global _isr1
global _isr2
global _isr3
global _isr4
global _isr5
global _isr6
global _isr7
global _isr8
global _isr9
global _isr10
global _isr11
global _isr12
global _isr13
global _isr14
global _isr15
global _isr16
global _isr17
global _isr18
global _isr19
global _isr20
global _isr21
global _isr22
global _isr23
global _isr24
global _isr25
global _isr26
global _isr27
global _isr28
global _isr29
global _isr30
global _isr31

global _isr80

_isr0:
    cli
    push byte 0
    push byte 0
    jmp _isr_common

_isr1:
    cli
    push byte 0
    push byte 1
    jmp _isr_common

_isr2:
    cli
    push byte 0
    push byte 2
    jmp _isr_common

_isr3:
    cli
    push byte 0
    push byte 3
    jmp _isr_common


_isr4:
    cli
    push byte 0
    push byte 4
    jmp _isr_common

_isr5:
    cli
    push byte 0
    push byte 5
    jmp _isr_common

_isr6:
    cli
    push byte 0
    push byte 6
    jmp _isr_common

_isr7:
    cli
    push byte 0
    push byte 7
    jmp _isr_common

_isr8:
    cli
    push byte 8
    jmp _isr_common

_isr9:
    cli
    push byte 0
    push byte 9
    jmp _isr_common

_isr10:
    cli
    push byte 10
    jmp _isr_common

_isr11:
    cli
    push byte 11
    jmp _isr_common

_isr12:
    cli
    push byte 12
    jmp _isr_common

_isr13:
    cli
    push byte 13
    jmp _isr_common

_isr14:
    cli
    push byte 14
    jmp _isr_common

_isr15:
    cli
    push byte 0
    push byte 15
    jmp _isr_common

_isr16:
    cli
    push byte 0
    push byte 16
    jmp _isr_common

_isr17:
    cli
    push byte 0
    push byte 17
    jmp _isr_common

_isr18:
    cli
    push byte 0
    push byte 18
    jmp _isr_common

_isr19:
_isr20:
_isr21:
_isr22:
_isr23:
_isr24:
_isr25:
_isr26:
_isr27:
_isr28:
_isr29:
_isr30:
_isr31:
    cli
    push byte 0
    push byte 19
    jmp _isr_common


_isr80:
    cli
    push byte 0
    push byte 80
    jmp _isr_common

extern _interrupt_handler

_isr_common:
    pusha
    push ds
    push es
    push fs
    push gs
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov eax, esp
    push eax
    mov eax, _interrupt_handler
    call eax
    pop eax
    pop gs
    pop fs
    pop es
    pop ds
    popa
    add esp, 8
    iret

global _irq0
global _irq1
global _irq2
global _irq3
global _irq4
global _irq5
global _irq6
global _irq7
global _irq8
global _irq9
global _irq10
global _irq11
global _irq12
global _irq13
global _irq14
global _irq15

_irq0:
    push byte 0
    push byte 32
    jmp _irq_common_stub

_irq1:
    push byte 0
    push byte 33
    jmp _irq_common_stub


_irq2:
    push byte 0
    push byte 34
    jmp _irq_common_stub


_irq3:
    push byte 0
    push byte 35
    jmp _irq_common_stub


_irq4:
    push byte 0
    push byte 36
    jmp _irq_common_stub


_irq5:
    push byte 0
    push byte 37
    jmp _irq_common_stub

_irq6:
    push byte 0
    push byte 38
    jmp _irq_common_stub

_irq7:
    push byte 0
    push byte 39
    jmp _irq_common_stub

_irq8:
    push byte 0
    push byte 40
    jmp _irq_common_stub

_irq9:
    push byte 0
    push byte 41
    jmp _irq_common_stub

_irq10:
    push byte 0
    push byte 42
    jmp _irq_common_stub


_irq11:
    push byte 0
    push byte 43
    jmp _irq_common_stub

_irq12:
    push byte 0
    push byte 44
    jmp _irq_common_stub

_irq13:
    push byte 0
    push byte 45
    jmp _irq_common_stub

_irq14:
    push byte 0
    push byte 46
    jmp _irq_common_stub

_irq15:
    push byte 0
    push byte 47
    jmp _irq_common_stub

extern _irq_handler

_irq_common_stub:
    pusha
    push ds
    push es
    push fs
    push gs
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov eax, esp
    push eax
    mov eax, _irq_handler
    call eax
    pop eax
    pop gs
    pop fs
    pop es
    pop ds
    popa
    add esp, 8
    iret

global _read_cr0
_read_cr0:
    mov eax, cr0
    retn

global _write_cr0
_write_cr0:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    mov cr0,  eax
    pop ebp
    retn

global _read_cr1
_read_cr1:
    mov eax, cr1
    retn

global _write_cr1
_write_cr1:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    mov cr1, eax
    pop ebp
    retn

global _read_cr2
_read_cr2:
    mov eax, cr2
    retn

global _write_cr2
_write_cr2:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    mov cr2, eax
    pop ebp
    retn

global _read_cr3
_read_cr3:
    mov eax, cr3
    retn

global _write_cr3
_write_cr3:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    mov cr3, eax
    pop ebp
    retn

global _flush_tlb
_flush_tlb:
    mov eax, cr3
    mov cr3, eax
    ret

global _get_registers
_get_registers:
    pushad
    push gs
    push fs
    push es
    push ds

    ret

global _set_registers
_set_registers:

    ret

global kthread_start_asm
kthread_start_asm:
    pushf
    pusha
    mov edx, esp
    mov esp, eax
    mov [esp], dword kthread_done
    call ecx
    kthread_done:
    mov esp, edx
    popa
    popf
    ret

global _asm_print_test
_asm_print_test:
    pusha
    mov eax, 4
    mov ebx, hello
    mov ecx, 5 
    mov edx, 10
    int 0x80
    popa
    push ebx
    ret

section .rodata
hello: db "Howdy!", 0x0A