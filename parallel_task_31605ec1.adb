with Ada.Text_IO;

procedure parallel_messages_task is

   task type Message_Task(Id : Integer);
   
   task body Message_Task is
   begin
      Ada.Text_IO.Put_Line("Task" & Integer'Image(Id) & " is printing a message.");
      
      for i in 1..3 loop
         Ada.Text_IO.Put_Line("Task" & Integer'Image(Id) & " - Message #" & Integer'Image(i));
      end loop;
   exception
      when others =>
         Ada.Text_IO.Put_Line("An error occurred in Task" & Integer'Image(Id));
   end Message_Task;
   
   -- 创建多个任务实例
   task1 : Message_Task(Id => 1);
   task2 : Message_Task(Id => 2);
   task3 : Message_Task(Id => 3);

begin
   Ada.Text_IO.Put_Line("Main program started.");
   
   Ada.Text_IO.Put_Line("Main program ending.");
end parallel_messages_task;