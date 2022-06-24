#define MY_REG_HEADER              = 0x0
#define MY_REG_SLAVEID             = 0x4
#define MY_REG_VERSION             = 0x8
#define MY_REG_BISSC1_POS          = 0xc
#define MY_REG_BISSC2_POS          = 0x10
#define MY_REG_BISSC3_POS          = 0x14
#define MY_REG_BISSC4_POS          = 0x18
#define MY_REG_RESERVE1            = 0x1c
#define MY_REG_RESERVE2            = 0x20
#define MY_REG_RESERVE3            = 0x24
#define MY_REG_RESERVE4            = 0x28
#define MY_REG_TTL_SINGLE          = 0x2c
#define MY_REG_OPT_SINGLE          = 0x30
#define MY_REG_ENCODER_ZEROSINGLE  = 0x34
#define MY_REG_ENCODER1_POS        = 0x38
#define MY_REG_ENCODER2_POS        = 0x3c
#define MY_REG_ENCODER3_POS        = 0x40
#define MY_REG_ENCODER4_POS        = 0x44
#define MY_REG_ENCODER1_LOCK_POS   = 0x48
#define MY_REG_ENCODER2_LOCK_POS   = 0x4c
#define MY_REG_ENCODER3_LOCK_POS   = 0x50
#define MY_REG_ENCODER4_LOCK_POS   = 0x54
#define MY_REG_AD7606_DATATEMP12   = 0x58
#define MY_REG_AD7606_DATATEMP34   = 0x5c
#define MY_REG_AD7606_DATATEMP56   = 0x60
#define MY_REG_AD7606_DATATEMP78   = 0x64
#define MY_REG_AD7606_DATATEMP910  = 0x68
#define MY_REG_AD7606_DATATEMP1112 = 0x6c
#define MY_REG_AD7606_DATATEMP1314 = 0x70
#define MY_REG_AD7606_DATATEMP1516 = 0x74
#define MY_REG_AD5544_DATATEMP12   = 0x10c
#define MY_REG_AD5544_DATATEMP34   = 0x110
#define MY_REG_AD5544_DATATEMP56   = 0x114
#define MY_REG_AD5544_DATATEMP78   = 0x118
#define MY_REG_AD5544_DATATEMP910  = 0x11c
#define MY_REG_AD5544_DATATEMP1112 = 0x120
#define MY_REG_M_EN_TTL            = 0x124
#define MY_REG_M_EN_TTL1           = 0x128
#define MY_REG_EMERGENCY           = 0x12c
#define MY_REG_PROJECT_ID          = 0x130
#define MY_REG_CONFIG_ENCODER      = 0x134
#define MY_REG_VALVE               = 0x138
#define MY_REG_FPGA_DO             = 0x13c
#define MY_REG_ENCODER_POS_CLR     = 0x140


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
        uint32_t BissC1_Pos:32;
    } reg;
} my_reg_bissc1_pos_t

typedef union{
    uint32_t val;
    struct{
        uint32_t BissC2_Pos:32;
    } reg;
} my_reg_bissc2_pos_t

typedef union{
    uint32_t val;
    struct{
        uint32_t BissC3_Pos:32;
    } reg;
} my_reg_bissc3_pos_t

typedef union{
    uint32_t val;
    struct{
        uint32_t BissC4_Pos:32;
    } reg;
} my_reg_bissc4_pos_t

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
        uint32_t na_:1;
        uint32_t TTL1_Single:1;
        uint32_t TTL2_Single:1;
        uint32_t TTL3_Single:1;
        uint32_t TTL4_Single:1;
        uint32_t TTL5_Single:1;
        uint32_t TTL6_Single:1;
        uint32_t TTL7_Single:1;
        uint32_t TTL8_Single:1;
        uint32_t na__:23;
    } reg;
} my_reg_ttl_single_t

typedef union{
    uint32_t val;
    struct{
        uint32_t na_:1;
        uint32_t Opt1_Single:1;
        uint32_t Opt2_Single:1;
        uint32_t Opt3_Single:1;
        uint32_t Opt4_Single:1;
        uint32_t Opt5_Single:1;
        uint32_t Opt6_Single:1;
        uint32_t Opt7_Single:1;
        uint32_t Opt8_Single:1;
        uint32_t Opt9_Single:1;
        uint32_t Opt10_Single:1;
        uint32_t Opt11_Single:1;
        uint32_t Opt12_Single:1;
        uint32_t Opt13_Single:1;
        uint32_t Opt14_Single:1;
        uint32_t Opt15_Single:1;
        uint32_t Opt16_Single:1;
        uint32_t na__:15;
    } reg;
} my_reg_opt_single_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Encoder1_ZeroSingle:1;
        uint32_t na_:7;
        uint32_t Encoder2_ZeroSingle:1;
        uint32_t na__:7;
        uint32_t Encoder3_ZeroSingle:1;
        uint32_t na___:7;
        uint32_t Encoder4_ZeroSingle:1;
        uint32_t na____:7;
    } reg;
} my_reg_encoder_zerosingle_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Encoder1_Pos:32;
    } reg;
} my_reg_encoder1_pos_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Encoder2_Pos:32;
    } reg;
} my_reg_encoder2_pos_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Encoder3_Pos:32;
    } reg;
} my_reg_encoder3_pos_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Encoder4_Pos:32;
    } reg;
} my_reg_encoder4_pos_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Encoder1_Lock_Pos:32;
    } reg;
} my_reg_encoder1_lock_pos_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Encoder2_Lock_Pos:32;
    } reg;
} my_reg_encoder2_lock_pos_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Encoder3_Lock_Pos:32;
    } reg;
} my_reg_encoder3_lock_pos_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Encoder4_Lock_Pos:32;
    } reg;
} my_reg_encoder4_lock_pos_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp1:16;
        uint32_t AD7606_Datatemp2:16;
    } reg;
} my_reg_ad7606_datatemp12_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp3:16;
        uint32_t AD7606_Datatemp4:16;
    } reg;
} my_reg_ad7606_datatemp34_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp5:16;
        uint32_t AD7606_Datatemp6:16;
    } reg;
} my_reg_ad7606_datatemp56_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp7:16;
        uint32_t AD7606_Datatemp8:16;
    } reg;
} my_reg_ad7606_datatemp78_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp9:16;
        uint32_t AD7606_Datatemp10:16;
    } reg;
} my_reg_ad7606_datatemp910_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp11:16;
        uint32_t AD7606_Datatemp12:16;
    } reg;
} my_reg_ad7606_datatemp1112_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp13:16;
        uint32_t AD7606_Datatemp14:16;
    } reg;
} my_reg_ad7606_datatemp1314_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD7606_Datatemp15:16;
        uint32_t AD7606_Datatemp16:16;
    } reg;
} my_reg_ad7606_datatemp1516_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD5544_Datatemp1:16;
        uint32_t AD5544_Datatemp2:16;
    } reg;
} my_reg_ad5544_datatemp12_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD5544_Datatemp3:16;
        uint32_t AD5544_Datatemp4:16;
    } reg;
} my_reg_ad5544_datatemp34_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD5544_Datatemp5:16;
        uint32_t AD5544_Datatemp6:16;
    } reg;
} my_reg_ad5544_datatemp56_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD5544_Datatemp7:16;
        uint32_t AD5544_Datatemp8:16;
    } reg;
} my_reg_ad5544_datatemp78_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD5544_Datatemp9:16;
        uint32_t AD5544_Datatemp10:16;
    } reg;
} my_reg_ad5544_datatemp910_t

typedef union{
    uint32_t val;
    struct{
        uint32_t AD5544_Datatemp11:16;
        uint32_t AD5544_Datatemp12:16;
    } reg;
} my_reg_ad5544_datatemp1112_t

typedef union{
    uint32_t val;
    struct{
        uint32_t na_:2;
        uint32_t M_EN_TTL1:1;
        uint32_t na__:7;
        uint32_t M_EN_TTL2:1;
        uint32_t na___:7;
        uint32_t M_EN_TTL3:1;
        uint32_t na____:7;
        uint32_t M_EN_TTL4:1;
        uint32_t na_____:5;
    } reg;
} my_reg_m_en_ttl_t

typedef union{
    uint32_t val;
    struct{
        uint32_t na_:2;
        uint32_t M_EN_TTL5:1;
        uint32_t na__:7;
        uint32_t M_EN_TTL6:1;
        uint32_t na___:7;
        uint32_t M_EN_TTL7:1;
        uint32_t na____:7;
        uint32_t M_EN_TTL8:1;
        uint32_t na_____:5;
    } reg;
} my_reg_m_en_ttl1_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Emergency:32;
    } reg;
} my_reg_emergency_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Project_ID:32;
    } reg;
} my_reg_project_id_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Config_Encoder:32;
    } reg;
} my_reg_config_encoder_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Valve:32;
    } reg;
} my_reg_valve_t

typedef union{
    uint32_t val;
    struct{
        uint32_t FPGA_DO_0:1;
        uint32_t na_:1;
        uint32_t FPGA_DO_1:1;
        uint32_t na__:1;
        uint32_t FPGA_DO_2:1;
        uint32_t na___:1;
        uint32_t FPGA_DO_3:1;
        uint32_t na____:1;
        uint32_t FPGA_DO_4:1;
        uint32_t na_____:1;
        uint32_t FPGA_DO_5:1;
        uint32_t na______:1;
        uint32_t FPGA_DO_6:1;
        uint32_t na_______:1;
        uint32_t FPGA_DO_7:1;
        uint32_t na________:1;
        uint32_t FPGA_DO_8:1;
        uint32_t na_________:1;
        uint32_t FPGA_DO_9:1;
        uint32_t na__________:1;
        uint32_t FPGA_DO_10:1;
        uint32_t na___________:1;
        uint32_t FPGA_DO_11:1;
        uint32_t na____________:1;
        uint32_t FPGA_DO_12:1;
        uint32_t na_____________:1;
        uint32_t FPGA_DO_13:1;
        uint32_t na______________:1;
        uint32_t FPGA_DO_14:1;
        uint32_t na_______________:1;
        uint32_t FPGA_DO_15:1;
        uint32_t na________________:1;
    } reg;
} my_reg_fpga_do_t

typedef union{
    uint32_t val;
    struct{
        uint32_t Encoder1_Pos_Clr:1;
        uint32_t na_:7;
        uint32_t Encoder2_Pos_Clr:1;
        uint32_t na__:7;
        uint32_t Encoder3_Pos_Clr:1;
        uint32_t na___:7;
        uint32_t Encoder4_Pos_Clr:1;
        uint32_t na____:7;
    } reg;
} my_reg_encoder_pos_clr_t