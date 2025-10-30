// 交通灯控制器 Verilog 状态机
// 包含红灯、黄灯、绿灯控制
// 适用于东西方向和南北方向

module traffic_light_controller(
    input wire clk,           // 系统时钟
    input wire reset,         // 复位信号
    input wire enable,        // 使能信号
    output reg [2:0] NS_light,  // 南北方向灯 (bit 0: red, bit 1: yellow, bit 2: green)
    output reg [2:0] EW_light   // 东西方向灯 (bit 0: red, bit 1: yellow, bit 2: green)
);

    // 定义状态
    parameter IDLE = 3'b000;
    parameter NS_GREEN = 3'b001;    // 南北方向绿灯
    parameter NS_YELLOW = 3'b010;   // 南北方向黄灯
    parameter EW_GREEN = 3'b011;    // 东西方向绿灯
    parameter EW_YELLOW = 3'b100;   // 东西方向黄灯
    
    // 计数器和状态定义
    reg [3:0] state;                // 当前状态
    reg [3:0] next_state;           // 下一状态
    reg [23:0] counter;             // 计数器，用于定时控制
    
    // 时间常量 (以时钟周期为单位)
    parameter T_NS_GREEN = 24'd5000000;  // 南北方向绿灯时间 (例如5秒，假设时钟频率为1MHz)
    parameter T_NS_YELLOW = 24'd1000000; // 南北方向黄灯时间 (例如1秒)
    parameter T_EW_GREEN = 24'd5000000;  // 东西方向绿灯时间 (例如5秒)
    parameter T_EW_YELLOW = 24'd1000000; // 东西方向黄灯时间 (例如1秒)
    
    // 状态寄存器
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            counter <= 24'd0;
        end
        else if (enable) begin
            if (counter < get_max_count(state)) begin
                counter <= counter + 1;
                state <= state;
            end
            else begin
                counter <= 24'd0;
                state <= next_state;
            end
        end
    end
    
    // 确定下一个状态
    always @(*) begin
        case (state)
            IDLE: next_state = NS_GREEN;
            NS_GREEN: next_state = NS_YELLOW;
            NS_YELLOW: next_state = EW_GREEN;
            EW_GREEN: next_state = EW_YELLOW;
            EW_YELLOW: next_state = NS_GREEN;  // 循环回到南北绿灯
            default: next_state = IDLE;
        endcase
    end
    
    // 获取当前状态的最大计数值
    function [23:0] get_max_count;
        input [3:0] current_state;
        begin
            case (current_state)
                IDLE: get_max_count = 24'd1;  // 立即切换到下一个状态
                NS_GREEN: get_max_count = T_NS_GREEN;
                NS_YELLOW: get_max_count = T_NS_YELLOW;
                EW_GREEN: get_max_count = T_EW_GREEN;
                EW_YELLOW: get_max_count = T_EW_YELLOW;
                default: get_max_count = 24'd1;
            endcase
        end
    endfunction
    
    // 输出逻辑 - 根据状态设置灯
    always @(*) begin
        case (state)
            IDLE: begin
                NS_light = 3'b100;  // 南北方向红灯 (bit 0: red = 1, bit 1: yellow = 0, bit 2: green = 0)
                EW_light = 3'b100;  // 东西方向红灯
            end
            NS_GREEN: begin
                NS_light = 3'b001;  // 南北方向绿灯
                EW_light = 3'b100;  // 东西方向红灯
            end
            NS_YELLOW: begin
                NS_light = 3'b010;  // 南北方向黄灯
                EW_light = 3'b100;  // 东西方向红灯
            end
            EW_GREEN: begin
                NS_light = 3'b100;  // 南北方向红灯
                EW_light = 3'b001;  // 东西方向绿灯
            end
            EW_YELLOW: begin
                NS_light = 3'b100;  // 南北方向红灯
                EW_light = 3'b010;  // 东西方向黄灯
            end
            default: begin
                NS_light = 3'b100;  // 默认红灯
                EW_light = 3'b100;  // 默认红灯
            end
        endcase
    end
    
endmodule

// 测试模块
module traffic_light_tb;
    reg clk;
    reg reset;
    reg enable;
    wire [2:0] NS_light;
    wire [2:0] EW_light;
    
    // 实例化交通灯控制器
    traffic_light_controller uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .NS_light(NS_light),
        .EW_light(EW_light)
    );
    
    // 时钟生成
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10个时间单位的周期，模拟100MHz时钟
    end
    
    // 测试序列
    initial begin
        // 初始化信号
        reset = 1;
        enable = 0;
        #20;
        reset = 0;
        enable = 1;
        
        // 运行足够长的时间以观察状态转换
        #150000000;  // 运行足够长的时间
        
        $finish;
    end
    
    // 监视输出
    initial begin
        $monitor("Time: %0t | State: %b | NS_light: %b (R:%b Y:%b G:%b) | EW_light: %b (R:%b Y:%b G:%b)", 
                 $time, uut.state, 
                 NS_light, NS_light[0], NS_light[1], NS_light[2],
                 EW_light, EW_light[0], EW_light[1], EW_light[2]);
    end
    
    // 将波形保存到VCD文件
    initial begin
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, traffic_light_tb);
    end
    
endmodule