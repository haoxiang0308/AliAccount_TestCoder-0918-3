with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

procedure parallel_messages is
   package Random_Int is new Ada.Numerics.Discrete_Random(Integer);
   use Random_Int;
   
   Gen : Random_Int.Generator;
   
   task type Message_Task;
   
   task body Message_Task is
      Local_Id : Integer;
      Delay_Time : Integer;
   begin
      -- 获取任务ID
      Local_Id := Integer(Message_Task'Identity);
      
      -- 生成随机延迟时间
      Delay_Time := Random(Gen) mod 5 + 1; -- 1到5秒之间的随机延迟
      
      -- 等待随机时间后打印消息
      delay Duration(Delay_Time);
      Ada.Text_IO.Put_Line("Task " & Integer'Image(Local_Id) & " says: Hello from parallel task!");
      
      -- 再次生成随机延迟并打印另一条消息
      Delay_Time := Random(Gen) mod 5 + 1;
      delay Duration(Delay_Time);
      Ada.Text_IO.Put_Line("Task " & Integer'Image(Local_Id) & " says: Another message after delay!");
   end Message_Task;
   
   -- 创建一些任务实例
   T1 : Message_Task;
   T2 : Message_Task;
   T3 : Message_Task;

begin
   -- 主程序等待所有任务完成
   Ada.Text_IO.Put_Line("Main program started, tasks are running in parallel...");
   delay 10.0; -- 等待足够长的时间让所有任务完成
   Ada.Text_IO.Put_Line("Main program ending.");
end parallel_messages;