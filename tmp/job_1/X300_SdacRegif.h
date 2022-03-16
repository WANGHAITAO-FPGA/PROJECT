#define MY_REG_HEADER            = 0x0
#define MY_REG_SLAVEID           = 0x4
#define MY_REG_ADDR              = 0x8
#define MY_REG_VERSION           = 0xc
#define MY_REG_RESERVE1          = 0x10
#define MY_REG_RESERVE2          = 0x14
#define MY_REG_RESERVE3          = 0x18
#define MY_REG_RESERVE4          = 0x1c
#define MY_REG_AD7606_DATATEMP1  = 0x20
#define MY_REG_AD7606_DATATEMP2  = 0x24
#define MY_REG_AD7606_DATATEMP3  = 0x28
#define MY_REG_AD7606_DATATEMP4  = 0x2c
#define MY_REG_AD7606_DATATEMP5  = 0x30
#define MY_REG_AD7606_DATATEMP6  = 0x34
#define MY_REG_AD7606_DATATEMP7  = 0x38
#define MY_REG_AD7606_DATATEMP8  = 0x3c
#define MY_REG_AD7606_DATATEMP9  = 0x40
#define MY_REG_AD7606_DATATEMP10 = 0x44
#define MY_REG_AD7606_DATATEMP11 = 0x48
#define MY_REG_AD7606_DATATEMP12 = 0x4c
#define MY_REG_AD7606_DATATEMP13 = 0x50
#define MY_REG_AD7606_DATATEMP14 = 0x54
#define MY_REG_AD7606_DATATEMP15 = 0x58
#define MY_REG_AD7606_DATATEMP16 = 0x5c
#define MY_REG_AD7606_DATATEMP17 = 0x60
#define MY_REG_AD7606_DATATEMP18 = 0x64
#define MY_REG_AD7606_DATATEMP19 = 0x68
#define MY_REG_AD7606_DATATEMP20 = 0x6c
#define MY_REG_AD7606_DATATEMP21 = 0x70
#define MY_REG_AD7606_DATATEMP22 = 0x74
#define MY_REG_AD7606_DATATEMP23 = 0x78
#define MY_REG_AD7606_DATATEMP24 = 0x7c
#define MY_REG_TAIL              = 0xfc


typedef union{
    uint32_t val;
    struct{
        uint32_t HEADER:32;
    } reg;
} my_reg_header_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Slaveid:32;
    } reg;
} my_reg_slaveid_t

typedef union{
    uint32_t val;
    struct{
        uint32_t ADDR:32;
    } reg;
} my_reg_addr_t

typedef union{
    uint32_t val;
    struct{
        uint32_t VERSION:32;
    } reg;
} my_reg_version_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Reserve1:32;
    } reg;
} my_reg_reserve1_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Reserve2:32;
    } reg;
} my_reg_reserve2_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Reserve3:32;
    } reg;
} my_reg_reserve3_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Reserve4:32;
    } reg;
} my_reg_reserve4_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp1:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp1_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp2:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp2_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp3:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp3_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp4:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp4_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp5:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp5_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp6:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp6_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp7:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp7_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp8:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp8_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp9:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp9_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp10:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp10_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp11:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp11_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp12:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp12_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp13:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp13_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp14:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp14_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp15:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp15_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp16:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp16_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp17:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp17_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp18:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp18_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp19:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp19_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp20:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp20_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp21:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp21_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp22:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp22_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp23:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp23_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp24:16;
        uint32_t na_:16;
    } reg;
} my_reg_ad7606_datatemp24_t

typedef union{
    uint32_t val;
    struct{
        uint32_t tail:32;
    } reg;
} my_reg_tail_t