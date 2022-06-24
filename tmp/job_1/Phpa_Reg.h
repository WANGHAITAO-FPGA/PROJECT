#define MY_REG_HEADER   = 0x0
#define MY_REG_SLAVEID  = 0x4
#define MY_REG_VERSION  = 0x8
#define MY_REG_ENCODER1 = 0xc
#define MY_REG_ENCODER2 = 0x10
#define MY_REG_ENCODER3 = 0x14
#define MY_REG_ENCODER4 = 0x18
#define MY_REG_END      = 0x1c


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
        uint32_t VERSION:32;
    } reg;
} my_reg_version_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Encoder1:32;
    } reg;
} my_reg_encoder1_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Encoder2:32;
    } reg;
} my_reg_encoder2_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Encoder3:32;
    } reg;
} my_reg_encoder3_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Encoder4:32;
    } reg;
} my_reg_encoder4_t

typedef union{
    uint32_t val;
    struct{
        uint32_t End:32;
    } reg;
} my_reg_end_t