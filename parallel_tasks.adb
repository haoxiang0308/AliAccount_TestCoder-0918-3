with Ada.Text_IO; use Ada.Text_IO;

procedure Parallel_Tasks is
   task Task_1;
   task Task_2;
   task Task_3;

   task body Task_1 is
   begin
      for I in 1..5 loop
         Put_Line("Task 1 - Message " & Integer'Image(I));
         delay 0.5;
      end loop;
   end Task_1;

   task body Task_2 is
   begin
      for I in 1..5 loop
         Put_Line("Task 2 - Message " & Integer'Image(I));
         delay 0.7;
      end loop;
   end Task_2;

   task body Task_3 is
   begin
      for I in 1..5 loop
         Put_Line("Task 3 - Message " & Integer'Image(I));
         delay 0.3;
      end loop;
   end Task_3;

begin
   Put_Line("Main procedure started");
   delay 3.0;
   Put_Line("Main procedure ending");
end Parallel_Tasks;