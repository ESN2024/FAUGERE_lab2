#include "../bsp/system.h"
#include "../bsp/drivers/inc/altera_avalon_pio_regs.h"
#include "../bsp/drivers/inc/altera_avalon_timer_regs.h"
#include "../bsp/HAL/inc/sys/alt_stdio.h"
#include "../bsp/HAL/inc/sys/alt_irq.h"	
#include "../bsp/HAL/inc/sys/alt_sys_init.h"
#include <io.h>
#include <alt_types.h>

#define MASK_4BITS 0xF

static void timer_IRQHandler (void * context, alt_u32 id)	{
    static alt_u16 cnt = 0;

    /* --- affectation de la valeur des digits en BCD --- */
    alt_u32 data = (cnt>>0) & MASK_4BITS;
    IOWR_ALTERA_AVALON_PIO_DATA(DIGIT0_BASE, data);
	
    data = (cnt>>4) & MASK_4BITS;
    IOWR_ALTERA_AVALON_PIO_DATA(DIGIT1_BASE, data);

    data = (cnt>>8) & MASK_4BITS;
    IOWR_ALTERA_AVALON_PIO_DATA(DIGIT2_BASE, data);
    /* --- */

    cnt++;
    if(cnt == (1<<12)) cnt = 0; // remise à zéro lorsque les 3 digits sont au max

	// clear timeout status register
	IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE, ALTERA_AVALON_TIMER_STATUS_TO_MSK);
}

int main()	{
	alt_irq_init(NULL);

	/* --- timer interrupt init --- */
	alt_ic_isr_register(TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID,
                        TIMER_0_IRQ,
                        timer_IRQHandler,
                        NULL,
                        NULL);
	alt_ic_irq_enable (TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID, TIMER_0_IRQ);
	/* --- */

	/* --- timer init --- */
	IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE, ALTERA_AVALON_TIMER_CONTROL_ITO_MSK|ALTERA_AVALON_TIMER_CONTROL_CONT_MSK|ALTERA_AVALON_TIMER_CONTROL_START_MSK);
	// set period
	//IOWR_ALTERA_AVALON_TIMER_PERIODL(TIMER_0_BASE, (500000)&0xFFFF);
	//IOWR_ALTERA_AVALON_TIMER_PERIODH(TIMER_0_BASE, ((500000)&(0xFFFF<<16))>>16);
	/* --- */

	while(1);

	return 0;
}