# CPU第二周作业

## 继续学习verilog的基本语法

- [Verilog 基础知识 (loongson-neuq.pages.dev)](https://loongson-neuq.pages.dev/p/verilog-基础知识/)
- [一个verilog刷题网站（HDLBits）](https://hdlbits.01xz.net/wiki/Main_Page)
- 其它互联网资源

## verilog小试手

### 1. 编码器

编码器将含有特定意义的信息编成若干二进制的代码，如8-3编码器将8个输入端的高低电平情况编成3位二进制代码，其真值表如下图所示：

|  a   |  b   |  c   |  d   |  e   |  f   |  g   |  h   |  |   y2 |   y1 |   y0 |
| :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: |--| ---: | ---: | ---: |
|  0   |  0   |  0   |  0   |  0   |  0   |  0   |  1   |  |    0 |    0 |    0 |
|  0   |  0   |  0   |  0   |  0   |  0   |  1   |  0   |  |    0 |    0 |    1 |
|  0   |  0   |  0   |  0   |  0   |  1   |  0   |  0   |  |    0 |    1 |    0 |
|  0   |  0   |  0   |  0   |  1   |  0   |  0   |  0   |  |    0 |    1 |    1 |
|  0   |  0   |  0   |  1   |  0   |  0   |  0   |  0   |  |    1 |    0 |    0 |
|  0   |  0   |  1   |  0   |  0   |  0   |  0   |  0   |  |    1 |    0 |    1 |
|  0   |  1   |  0   |  0   |  0   |  0   |  0   |  0   |  |    1 |    1 |    0 |
|  1   |  0   |  0   |  0   |  0   |  0   |  0   |  0   |  |    1 |    1 |    1 |

**要求：**

- 实现一个8-3编码器。
- 编写激励文件，完成仿真，验证功能正确性。
- 将**rtl文件**、**tb文件**、**仿真波形截图**放置在 **./encoder** 下。

### 2. 译码器

译码器是编码器的逆过程，将含有特定意义的信息编成若干二进制的代码，如3-8译码器将3位二进制代码译成8个输出端的高低电平情况，其真值表如下图所示：

|  a   |  b   |  c   |  |   y7 |   y6 |   y5 |   y4 |   y3 |   y2 |   y1 |   y0 |
| :--: | :--: | :--: |--| ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
|  0   |  0   |  0   |  |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    1 |
|  0   |  0   |  1   |  |    0 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |
|  0   |  1   |  0   |  |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    0 |
|  0   |  1   |  1   |  |    0 |    0 |    0 |    0 |    1 |    0 |    0 |    0 |
|  1   |  0   |  0   |  |    0 |    0 |    0 |    1 |    0 |    0 |    0 |    0 |
|  1   |  0   |  1   |  |    0 |    0 |    1 |    0 |    0 |    0 |    0 |    0 |
|  1   |  1   |  0   |  |    0 |    1 |    0 |    0 |    0 |    0 |    0 |    0 |
|  1   |  1   |  1   |  |    1 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |

**要求：**

- 实现一个3-8译码器。
- 编写激励文件，完成仿真，验证功能正确性。
- 将**rtl文件**、**tb文件**、**仿真波形截图**放置在 **./decoder** 下。

### 3. 寄存器堆

寄存器堆是CPU中的一个**重要组成部分**，是**有限**存贮容量的高速存贮部件，用来暂存**指令、数据和地址**。

可以把它想象成一个书架 *（寄存器堆）* ，书架有很多层 *（寄存器）* ，每层有各自的编号 *（地址）*，每层可以装各自的书 *（数据）* ，在需要的时候我们可以根据编号取出 *（读操作）* 对应层里面的书 *（数据）*，也可以往里放 *（写操作）* 新的书 *（数据，注意此时旧的数据将会被覆盖）* 。

在这里提到一个名词**使能（enable）**，就如同其名字一样，使能就是使...能...，即激活某个功能或操作。在寄存器堆中，使能就是激活读或写操作，不使能就是不进行读或写操作。*使能将会在后续的代码中作为控制信号频繁出现*

**要求：**

- 本寄存器堆为“两读一写”的结构，也就是有两个读端口（读端口没有使能位控制，表示永远使能）和一个写端口，接口信号如下表所示：

| **名称** | **宽度** | **方向** |      **描述**       |
| :------: | :------: | :------: | :-----------------: |
|   clk    |    1     |  input   |      时钟信号       |
|  raddr1  |    5     |  input   |   寄存器堆读地址1   |
|  rdata1  |    32    |  output  | 寄存器堆读返回数据1 |
|  raddr2  |    5     |  input   |   寄存器堆读地址2   |
|  rdata2  |    32    |  output  | 寄存器堆读返回数据2 |
|    we    |    1     |  input   |   寄存器堆写使能    |
|  waddr   |    5     |  input   |   寄存器堆写地址    |
|  wdata   |    32    |  input   |   寄存器堆写数据    |

- 将**rtl文件**、**tb文件**、**仿真波形截图**放置在 **./regfile** 下。
