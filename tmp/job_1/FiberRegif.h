#define MY_REG0    = 0x0
#define MY_REG1    = 0x4
#define MY_REG2    = 0x8
#define DATA_TEMP0 = 0x14
#define DATA_TEMP1 = 0x18


typedef union{
    uint32_t val;
    struct{
        uint32_t HEADER:32;
    } reg;
} my_reg0_t

typedef union{
    uint32_t val;
    struct{
        uint32_t VERSION:32;
    } reg;
} my_reg1_t

typedef union{
    uint32_t val;
    struct{
        uint32_t SEND_CNT:32;
    } reg;
} my_reg2_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD5544_DATA_0_TEMP:16;
        uint32_t AD5544_DATA_1_TEMP:16;
    } reg;
} data_temp0_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD5544_DATA_2_TEMP:16;
        uint32_t AD5544_DATA_3_TEMP:16;
    } reg;
} data_temp1_t