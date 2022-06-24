#define MY_REG0  = 0x10000
#define MY_REG1  = 0x10004
#define MY_REG2  = 0x10008
#define MY_REG3  = 0x10040
#define MY_REG4  = 0x10044
#define MY_REG5  = 0x10048
#define MY_REG6  = 0x10080
#define MY_REG7  = 0x10084
#define MY_REG8  = 0x10088
#define MY_REG9  = 0x10120
#define MY_REG10 = 0x10124
#define MY_REG11 = 0x10128
#define MY_REG12 = 0x10ffc
#define MY_REG13 = 0x117fc
#define MY_REG14 = 0x11ffc
#define MY_REG15 = 0x127fc


typedef union{
    uint32_t val;
    struct{
        uint32_t Hssl1_Status:32;
    } reg;
} my_reg0_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Hssl1_CTL_RST:1;
        uint32_t na_:1;
        uint32_t Hssl1_CTL_SEND:1;
        uint32_t na__:4;
        uint32_t Hssl1_CTL_TRIGGER:1;
        uint32_t na___:24;
    } reg;
} my_reg1_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Hssl1_SR_REG:32;
    } reg;
} my_reg2_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Hssl2_Status:32;
    } reg;
} my_reg3_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Hssl2_CTL_RST:1;
        uint32_t na_:1;
        uint32_t Hssl2_CTL_SEND:1;
        uint32_t na__:4;
        uint32_t Hssl2_CTL_TRIGGER:1;
        uint32_t na___:24;
    } reg;
} my_reg4_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Hssl2_SR_REG:32;
    } reg;
} my_reg5_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Hssl3_Status:32;
    } reg;
} my_reg6_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Hssl3_CTL_RST:1;
        uint32_t na_:1;
        uint32_t Hssl3_CTL_SEND:1;
        uint32_t na__:4;
        uint32_t Hssl3_CTL_TRIGGER:1;
        uint32_t na___:24;
    } reg;
} my_reg7_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Hssl3_SR_REG:32;
    } reg;
} my_reg8_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Hssl4_Status:32;
    } reg;
} my_reg9_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Hssl4_CTL_RST:1;
        uint32_t na_:1;
        uint32_t Hssl4_CTL_SEND:1;
        uint32_t na__:4;
        uint32_t Hssl4_CTL_TRIGGER:1;
        uint32_t na___:24;
    } reg;
} my_reg10_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Hssl4_SR_REG:32;
    } reg;
} my_reg11_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Hssl1_Tx_Frame:32;
    } reg;
} my_reg12_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Hssl2_Tx_Frame:32;
    } reg;
} my_reg13_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Hssl3_Tx_Frame:32;
    } reg;
} my_reg14_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Hssl4_Tx_Frame:32;
    } reg;
} my_reg15_t