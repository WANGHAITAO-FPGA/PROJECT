#define MY_REG0  = 0x0
#define MY_REG1  = 0x2
#define MY_REG2  = 0x4
#define MY_REG3  = 0x6
#define MY_REG4  = 0x8
#define MY_REG5  = 0xa
#define MY_REG6  = 0xc
#define MY_REG7  = 0xe
#define MY_REG8  = 0x10
#define MY_REG9  = 0x12
#define MY_REG10 = 0x14
#define MY_REG11 = 0x16
#define MY_REG12 = 0x18
#define MY_REG13 = 0x1a
#define MY_REG14 = 0x1c
#define MY_REG15 = 0x1e
#define MY_REG16 = 0x20
#define MY_REG17 = 0x22
#define MY_REG18 = 0x24
#define MY_REG19 = 0x26
#define MY_REG20 = 0x28
#define MY_REG21 = 0x2a
#define MY_REG22 = 0x2c
#define MY_REG23 = 0x2e
#define MY_REG24 = 0x30
#define MY_REG25 = 0x32
#define MY_REG26 = 0x34
#define MY_REG27 = 0x36
#define MY_REG28 = 0x38
#define MY_REG29 = 0x3a
#define MY_REG30 = 0x3c
#define MY_REG31 = 0x3e
#define MY_REG32 = 0x40
#define MY_REG33 = 0x42
#define MY_REG34 = 0x44
#define MY_REG35 = 0x46


typedef union{
    uint16_t val;
    struct{
        uint16_t VME_Reg0:16;
    } reg;
} my_reg0_t

typedef union{
    uint16_t val;
    struct{
        uint16_t VME_Reg1:16;
    } reg;
} my_reg1_t

typedef union{
    uint16_t val;
    struct{
        uint16_t VME_Reg2:16;
    } reg;
} my_reg2_t

typedef union{
    uint16_t val;
    struct{
        uint16_t VME_Reg3:16;
    } reg;
} my_reg3_t

typedef union{
    uint16_t val;
    struct{
        uint16_t VME_Reg4:16;
    } reg;
} my_reg4_t

typedef union{
    uint16_t val;
    struct{
        uint16_t VME_Reg5:16;
    } reg;
} my_reg5_t

typedef union{
    uint16_t val;
    struct{
        uint16_t VME_Reg6:16;
    } reg;
} my_reg6_t

typedef union{
    uint16_t val;
    struct{
        uint16_t VME_Reg7:16;
    } reg;
} my_reg7_t

typedef union{
    uint16_t val;
    struct{
        uint16_t VME_Reg8:16;
    } reg;
} my_reg8_t

typedef union{
    uint16_t val;
    struct{
        uint16_t VME_Reg9:16;
    } reg;
} my_reg9_t

typedef union{
    uint16_t val;
    struct{
        uint16_t VME_Reg10:16;
    } reg;
} my_reg10_t

typedef union{
    uint16_t val;
    struct{
        uint16_t VME_Reg11:16;
    } reg;
} my_reg11_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg0_H:16;
    } reg;
} my_reg12_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg0_L:16;
    } reg;
} my_reg13_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg1_H:16;
    } reg;
} my_reg14_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg1_L:16;
    } reg;
} my_reg15_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg2_H:16;
    } reg;
} my_reg16_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg2_L:16;
    } reg;
} my_reg17_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg3_H:16;
    } reg;
} my_reg18_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg3_L:16;
    } reg;
} my_reg19_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg4_H:16;
    } reg;
} my_reg20_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg4_L:16;
    } reg;
} my_reg21_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg5_H:16;
    } reg;
} my_reg22_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg5_L:16;
    } reg;
} my_reg23_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg6_H:16;
    } reg;
} my_reg24_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg6_L:16;
    } reg;
} my_reg25_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg7_H:16;
    } reg;
} my_reg26_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg7_L:16;
    } reg;
} my_reg27_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg8_H:16;
    } reg;
} my_reg28_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg8_L:16;
    } reg;
} my_reg29_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg9_H:16;
    } reg;
} my_reg30_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg9_L:16;
    } reg;
} my_reg31_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg10_H:16;
    } reg;
} my_reg32_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg10_L:16;
    } reg;
} my_reg33_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg11_H:16;
    } reg;
} my_reg34_t

typedef union{
    uint16_t val;
    struct{
        uint16_t SENSOR_Reg11_L:16;
    } reg;
} my_reg35_t