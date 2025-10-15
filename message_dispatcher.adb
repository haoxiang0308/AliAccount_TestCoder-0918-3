with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Message_Dispatcher is
   task type Message_Task (ID : Integer);
   
   task body Message_Task is
      Local_ID : constant Integer := ID;
   begin
      for Counter in 1..3 loop
         Put ("Task ");
         Ada.Integer_Text_IO.Put (Local_ID, Width => 1);
         Put (" - Message ");
         Ada.Integer_Text_IO.Put (Counter, Width => 1);
         New_Line;
         delay 0.8;
      end loop;
   end Message_Task;
   
   Task_A : Message_Task (1);
   Task_B : Message_Task (2);
   Task_C : Message_Task (3);

begin
   Put_Line ("Message dispatcher started");
   delay 3.5;
   Put_Line ("Message dispatcher finished");
end Message_Dispatcher;