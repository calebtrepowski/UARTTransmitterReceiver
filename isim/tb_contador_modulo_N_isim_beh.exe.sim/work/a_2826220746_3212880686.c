/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/keil/Documents/Proyectos_Xilinx/UARTTransmitterReceiver/contador_modulo_N.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1006216973935652998_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_1242562249_sub_1434214030532789707_1035706684(char *, char *, char *, char *, char *);


static void work_a_2826220746_3212880686_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(21, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 3640);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(22, ng0);
    t4 = (t0 + 1192U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t2 = (t0 + 3752);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t4, 12U);
    xsi_driver_first_trans_fast(t2);

LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(23, ng0);
    t4 = xsi_get_transient_memory(12U);
    memset(t4, 0, 12U);
    t11 = t4;
    memset(t11, (unsigned char)2, 12U);
    t12 = (t0 + 3752);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t4, 12U);
    xsi_driver_first_trans_fast(t12);
    goto LAB9;

}

static void work_a_2826220746_3212880686_p_1(char *t0)
{
    char t5[16];
    char t17[16];
    char *t1;
    char *t2;
    char *t3;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned char t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;

LAB0:    xsi_set_current_line(31, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 6040U);
    t3 = (t0 + 6090);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 11;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (11 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t10 = ieee_p_1242562249_sub_1434214030532789707_1035706684(IEEE_P_1242562249, t2, t1, t3, t5);
    if (t10 != 0)
        goto LAB3;

LAB4:
LAB5:    t18 = (t0 + 1512U);
    t19 = *((char **)t18);
    t18 = (t0 + 6040U);
    t20 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t17, t19, t18, 1);
    t21 = (t17 + 12U);
    t9 = *((unsigned int *)t21);
    t22 = (1U * t9);
    t23 = (12U != t22);
    if (t23 == 1)
        goto LAB7;

LAB8:    t24 = (t0 + 3816);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t20, 12U);
    xsi_driver_first_trans_fast(t24);

LAB2:    t29 = (t0 + 3656);
    *((int *)t29) = 1;

LAB1:    return;
LAB3:    t7 = xsi_get_transient_memory(12U);
    memset(t7, 0, 12U);
    t11 = t7;
    memset(t11, (unsigned char)2, 12U);
    t12 = (t0 + 3816);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 12U);
    xsi_driver_first_trans_fast(t12);
    goto LAB2;

LAB6:    goto LAB2;

LAB7:    xsi_size_not_matching(12U, t22, 0);
    goto LAB8;

}

static void work_a_2826220746_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(34, ng0);

LAB3:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 3880);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 12U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3672);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_2826220746_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2826220746_3212880686_p_0,(void *)work_a_2826220746_3212880686_p_1,(void *)work_a_2826220746_3212880686_p_2};
	xsi_register_didat("work_a_2826220746_3212880686", "isim/tb_contador_modulo_N_isim_beh.exe.sim/work/a_2826220746_3212880686.didat");
	xsi_register_executes(pe);
}
