#include <kthread.h>

extern struct regs last_interrupt_regs;

extern void _set_registers(struct kthread_context *context);
extern void _get_registers(struct kthread_context *context);

void start_kthread(struct kthread *thread);
void end_kthread(struct kthread *thread);

void create_kthread(void (*func)(), struct kthread *thread) {
    thread->func = func;
    thread->context.eax = thread->context.ebx = thread->context.ecx = thread->context.edx = 0;
    thread->context.gs = last_interrupt_regs.gs;
    thread->context.fs = last_interrupt_regs.fs;
    thread->context.ds = last_interrupt_regs.ds;
    thread->context.es = last_interrupt_regs.es;

    uint32_t stack = allocate_page(0);
    kprintf("Stack = 0x%x\n", (uint64_t) stack);
    map_page(stack, stack, 3);
    thread->context.esp = stack + 0x1000;

    kprintf("Created thread\n");
}

struct kthread_context last_context;

void start_kthread(struct kthread *thread) {
    
    asm volatile (
        "call kthread_start_asm"
        :
        : "a" (thread->context.esp), "c" (thread->func), "b" (end_kthread)
        );

    kprintf("Ended thread.");
    return;
}

void end_kthread(struct kthread *thread) {
    kprintf("Done.\n");
    asm volatile("hlt");
}