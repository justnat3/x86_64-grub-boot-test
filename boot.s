.set ALIGN,   1<<0 		/* 1 */
.set MEMINFO, 1<<1 		/* 2 */
.set FLAGS,   ALIGN | MEMINFO	/* our flag field */
.set MAGIC,   0x1BADB002	/* magic */
.set CHECKSUM,-(MAGIC + FLAGS) 	/* checksum */

.section .multiboot	/* align to 4 bytes our "32bit section" */
.align 4 
.long MAGIC
.long FLAGS 			
.long CHECKSUM

.section .bss
stack_bottom:
	.skip 16384 
stack_top:

.section .text
.global _start
.type _start, @function

_start:
	cli 
	cld
	hlt

.size _start, . - _start
