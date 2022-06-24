#define MY_REG_HEADER   = 0x0
#define MY_REG_SLAVEID  = 0x4
#define UART_DATA1      = 0x8
#define UART_DATA2      = 0xc
#define MY_REG_RESERVE1 = 0x10
#define MY_REG_RESERVE2 = 0x14
#define MY_REG_RESERVE3 = 0x18
#define MY_REG_RESERVE4 = 0x1c
#define MY_REG_RESERVE5 = 0x20
#define MY_REG_RESERVE6 = 0x24
#define UART_DATA1      = 0x28
#define UART_DATA2      = 0x2c
#define MY_REG_RESERVE1 = 0x30
#define MY_REG_RESERVE2 = 0x34
#define MY_REG_RESERVE3 = 0x38
#define MY_REG_RESERVE4 = 0x3c
#define MY_REG_RESERVE5 = 0x40
#define MY_REG_RESERVE6 = 0x44
#define UART_DATA1      = 0x48
#define UART_DATA2      = 0x4c
#define MY_REG_RESERVE1 = 0x50
#define MY_REG_RESERVE2 = 0x54
#define MY_REG_RESERVE3 = 0x58
#define MY_REG_RESERVE4 = 0x5c
#define MY_REG_RESERVE5 = 0x60
#define MY_REG_RESERVE6 = 0x64
#define UART_DATA1      = 0x68
#define UART_DATA2      = 0x6c
#define MY_REG_RESERVE1 = 0x70
#define MY_REG_RESERVE2 = 0x74
#define MY_REG_RESERVE3 = 0x78
#define MY_REG_RESERVE4 = 0x7c
#define MY_REG_RESERVE5 = 0x80
#define MY_REG_RESERVE6 = 0x84
#define UART_DATA1      = 0x88
#define UART_DATA2      = 0x8c
#define MY_REG_RESERVE1 = 0x90
#define MY_REG_RESERVE2 = 0x94
#define MY_REG_RESERVE3 = 0x98
#define MY_REG_RESERVE4 = 0x9c
#define MY_REG_RESERVE5 = 0xa0
#define MY_REG_RESERVE6 = 0xa4
#define UART_DATA1      = 0xa8
#define UART_DATA2      = 0xac
#define MY_REG_RESERVE1 = 0xb0
#define MY_REG_RESERVE2 = 0xb4
#define MY_REG_RESERVE3 = 0xb8
#define MY_REG_RESERVE4 = 0xbc
#define MY_REG_RESERVE5 = 0xc0
#define MY_REG_RESERVE6 = 0xc4
#define UART_DATA1      = 0xc8
#define UART_DATA2      = 0xcc
#define MY_REG_RESERVE1 = 0xd0
#define MY_REG_RESERVE2 = 0xd4
#define MY_REG_RESERVE3 = 0xd8
#define MY_REG_RESERVE4 = 0xdc
#define MY_REG_RESERVE5 = 0xe0
#define MY_REG_RESERVE6 = 0xe4


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
        uint32_t uart_addr:16;
        uint32_t uart_function:8;
        uint32_t uart_slaveid:8;
    } reg;
} uart_data1_t

typedef union{
    uint32_t val;
    struct{
        uint32_t crc_data:16;
        uint32_t reg_num:16;
    } reg;
} uart_data2_t

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
        uint32_t Reserve5:32;
    } reg;
} my_reg_reserve5_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Reserve6:32;
    } reg;
} my_reg_reserve6_t

typedef union{
    uint32_t val;
    struct{
        uint32_t uart_addr:16;
        uint32_t uart_function:8;
        uint32_t uart_slaveid:8;
    } reg;
} uart_data1_t

typedef union{
    uint32_t val;
    struct{
        uint32_t crc_data:16;
        uint32_t reg_num:16;
    } reg;
} uart_data2_t

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
        uint32_t Reserve5:32;
    } reg;
} my_reg_reserve5_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Reserve6:32;
    } reg;
} my_reg_reserve6_t

typedef union{
    uint32_t val;
    struct{
        uint32_t uart_addr:16;
        uint32_t uart_function:8;
        uint32_t uart_slaveid:8;
    } reg;
} uart_data1_t

typedef union{
    uint32_t val;
    struct{
        uint32_t crc_data:16;
        uint32_t reg_num:16;
    } reg;
} uart_data2_t

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
        uint32_t Reserve5:32;
    } reg;
} my_reg_reserve5_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Reserve6:32;
    } reg;
} my_reg_reserve6_t

typedef union{
    uint32_t val;
    struct{
        uint32_t uart_addr:16;
        uint32_t uart_function:8;
        uint32_t uart_slaveid:8;
    } reg;
} uart_data1_t

typedef union{
    uint32_t val;
    struct{
        uint32_t crc_data:16;
        uint32_t reg_num:16;
    } reg;
} uart_data2_t

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
        uint32_t Reserve5:32;
    } reg;
} my_reg_reserve5_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Reserve6:32;
    } reg;
} my_reg_reserve6_t

typedef union{
    uint32_t val;
    struct{
        uint32_t uart_addr:16;
        uint32_t uart_function:8;
        uint32_t uart_slaveid:8;
    } reg;
} uart_data1_t

typedef union{
    uint32_t val;
    struct{
        uint32_t crc_data:16;
        uint32_t reg_num:16;
    } reg;
} uart_data2_t

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
        uint32_t Reserve5:32;
    } reg;
} my_reg_reserve5_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Reserve6:32;
    } reg;
} my_reg_reserve6_t

typedef union{
    uint32_t val;
    struct{
        uint32_t uart_addr:16;
        uint32_t uart_function:8;
        uint32_t uart_slaveid:8;
    } reg;
} uart_data1_t

typedef union{
    uint32_t val;
    struct{
        uint32_t crc_data:16;
        uint32_t reg_num:16;
    } reg;
} uart_data2_t

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
        uint32_t Reserve5:32;
    } reg;
} my_reg_reserve5_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Reserve6:32;
    } reg;
} my_reg_reserve6_t

typedef union{
    uint32_t val;
    struct{
        uint32_t uart_addr:16;
        uint32_t uart_function:8;
        uint32_t uart_slaveid:8;
    } reg;
} uart_data1_t

typedef union{
    uint32_t val;
    struct{
        uint32_t crc_data:16;
        uint32_t reg_num:16;
    } reg;
} uart_data2_t

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
        uint32_t Reserve5:32;
    } reg;
} my_reg_reserve5_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Reserve6:32;
    } reg;
} my_reg_reserve6_t