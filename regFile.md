|module name|base addr|offset|reg name|bit filed|attribute|description|
|---------|----------|----------|----------|----------|----------|----------|
AD5544_Triger|0x0|0x2|not named|[0:0]|R| AD5544----使能|
AD5544_1|0x100|0x0|not named|[15:0]|W| ad5544---通道1输出数据|
^|^|0x0|not named|[15:0]|R| ad5544---通道1输出数据|
^|^|0x2|not named|[15:0]|W| ad5544---通道2输出数据|
^|^|0x2|not named|[15:0]|R| ad5544---通道2输出数据|
^|^|0x4|not named|[15:0]|W| ad5544---通道3输出数据|
^|^|0x4|not named|[15:0]|R| ad5544---通道3输出数据|
^|^|0x6|not named|[15:0]|W| ad5544---通道4输出数据|
^|^|0x6|not named|[15:0]|R| ad5544---通道4输出数据|
AD5544_2|0x200|0x0|not named|[15:0]|W| ad5544---通道1输出数据|
^|^|0x0|not named|[15:0]|R| ad5544---通道1输出数据|
^|^|0x2|not named|[15:0]|W| ad5544---通道2输出数据|
^|^|0x2|not named|[15:0]|R| ad5544---通道2输出数据|
^|^|0x4|not named|[15:0]|W| ad5544---通道3输出数据|
^|^|0x4|not named|[15:0]|R| ad5544---通道3输出数据|
^|^|0x6|not named|[15:0]|W| ad5544---通道4输出数据|
^|^|0x6|not named|[15:0]|R| ad5544---通道4输出数据|
Biss_c|0x400|0x0|not named|[15:0]|R| Biss光栅尺数据—高16位|
^|^|0x2|not named|[15:0]|R| Biss光栅尺数据—低16位|
^|^|0x4|not named|[15:0]|R| Biss光栅尺状态，bit0---crc,bit1---warn,bit2---error|
GPIO|0x500|0x0|io_gpioA_driver|[11:0]|W| gpioA输出数据|
^|^|0x0|io_gpioA_driver|[11:0]|R| gpioA输出数据|
^|^|0x4|io_gpioB_driver|[11:0]|W| gpioB输出数据|
^|^|0x4|io_gpioB_driver|[11:0]|R| gpioB输出数据|

