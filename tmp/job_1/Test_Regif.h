#define MY_REG_HEADER  = 0x0
#define MY_REG_SLAVEID = 0x4
#define MY_REG_ADDRESS = 0x8
#define MY_REG_DATA1   = 0x28
#define MY_REG_DATA2   = 0x2c
#define MY_REG_DATA3   = 0x30
#define MY_REG_DATA4   = 0x34
#define MY_REG_DATA5   = 0x38
#define MY_REG_DATA6   = 0x3c
#define MY_REG1_DATA1  = 0x68
#define MY_REG1_DATA2  = 0x6c
#define MY_REG1_DATA3  = 0x70
#define MY_REG1_DATA4  = 0x74
#define MY_REG1_DATA5  = 0x78
#define MY_REG1_DATA6  = 0x7c
#define MY_REG_CRC     = 0x80
#define MY_REG_END     = 0x84


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
        uint32_t Address:32;
    } reg;
} my_reg_address_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Data1:32;
    } reg;
} my_reg_data1_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Data2:32;
    } reg;
} my_reg_data2_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Data3:32;
    } reg;
} my_reg_data3_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Data4:32;
    } reg;
} my_reg_data4_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Data5:32;
    } reg;
} my_reg_data5_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Data6:32;
    } reg;
} my_reg_data6_t

typedef union{
    uint32_t val;
    struct{
        uint32_t E_Data1:32;
    } reg;
} my_reg1_data1_t

typedef union{
    uint32_t val;
    struct{
        uint32_t E_Data2:32;
    } reg;
} my_reg1_data2_t

typedef union{
    uint32_t val;
    struct{
        uint32_t E_Data3:32;
    } reg;
} my_reg1_data3_t

typedef union{
    uint32_t val;
    struct{
        uint32_t E_Data4:32;
    } reg;
} my_reg1_data4_t

typedef union{
    uint32_t val;
    struct{
        uint32_t E_Data5:32;
    } reg;
} my_reg1_data5_t

typedef union{
    uint32_t val;
    struct{
        uint32_t E_Data6:32;
    } reg;
} my_reg1_data6_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Crc:32;
    } reg;
} my_reg_crc_t

typedef union{
    uint32_t val;
    struct{
        uint32_t End:32;
    } reg;
} my_reg_end_t