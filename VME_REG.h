#define MY_REG0  = 0x0
#define MY_REG1  = 0x4
#define MY_REG2  = 0x8
#define MY_REG3  = 0xc
#define MY_REG4  = 0x10
#define MY_REG5  = 0x14
#define MY_REG6  = 0x18
#define MY_REG7  = 0x1c
#define MY_REG8  = 0x20
#define MY_REG9  = 0x24
#define MY_REG10 = 0x28
#define MY_REG11 = 0x2c
#define MY_REG12 = 0x30
#define MY_REG13 = 0x34
#define MY_REG14 = 0x38
#define MY_REG15 = 0x3c
#define MY_REG16 = 0x40
#define MY_REG17 = 0x44


typedef union{
    uint32_t val;
    struct{
        uint32_t VME_Reg0:32;
    } reg;
} my_reg0_t

typedef union{
    uint32_t val;
    struct{
        uint32_t VME_Reg1:32;
    } reg;
} my_reg1_t

typedef union{
    uint32_t val;
    struct{
        uint32_t VME_Reg2:32;
    } reg;
} my_reg2_t

typedef union{
    uint32_t val;
    struct{
        uint32_t VME_Reg3:32;
    } reg;
} my_reg3_t

typedef union{
    uint32_t val;
    struct{
        uint32_t VME_Reg4:32;
    } reg;
} my_reg4_t

typedef union{
    uint32_t val;
    struct{
        uint32_t VME_Reg5:32;
    } reg;
} my_reg5_t

typedef union{
    uint32_t val;
    struct{
        uint32_t SENSOR_Reg0:32;
    } reg;
} my_reg6_t

typedef union{
    uint32_t val;
    struct{
        uint32_t SENSOR_Reg1:32;
    } reg;
} my_reg7_t

typedef union{
    uint32_t val;
    struct{
        uint32_t SENSOR_Reg2:32;
    } reg;
} my_reg8_t

typedef union{
    uint32_t val;
    struct{
        uint32_t SENSOR_Reg3:32;
    } reg;
} my_reg9_t

typedef union{
    uint32_t val;
    struct{
        uint32_t SENSOR_Reg4:32;
    } reg;
} my_reg10_t

typedef union{
    uint32_t val;
    struct{
        uint32_t SENSOR_Reg5:32;
    } reg;
} my_reg11_t

typedef union{
    uint32_t val;
    struct{
        uint32_t SENSOR_Reg6:32;
    } reg;
} my_reg12_t

typedef union{
    uint32_t val;
    struct{
        uint32_t SENSOR_Reg7:32;
    } reg;
} my_reg13_t

typedef union{
    uint32_t val;
    struct{
        uint32_t SENSOR_Reg8:32;
    } reg;
} my_reg14_t

typedef union{
    uint32_t val;
    struct{
        uint32_t SENSOR_Reg9:32;
    } reg;
} my_reg15_t

typedef union{
    uint32_t val;
    struct{
        uint32_t SENSOR_Reg10:32;
    } reg;
} my_reg16_t

typedef union{
    uint32_t val;
    struct{
        uint32_t SENSOR_Reg11:32;
    } reg;
} my_reg17_t