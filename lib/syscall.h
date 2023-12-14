#ifndef __SYSCALL_H_INCLUDED__
#define __SYSCALL_H_INCLUDED__

#include <system.h>

void syscalls_install();
void syscall_handler(struct regs *r);
#endif