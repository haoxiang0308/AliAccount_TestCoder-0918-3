with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
with Ada.Calendar;
with Ada.Calendar.Formatting;
with Ada.Strings.Unbounded;
with Ada.Command_Line;

procedure Parallel_Tasks is
   protected Printer is
      procedure Print (Msg : String);
   private
      procedure Print_Time_Stamp;
   end Printer;

   protected body Printer is
      procedure Print_Time_Stamp is
      begin
         Ada.Text_IO.Put_Line(Ada.Calendar.Formatting.Image(Ada.Calendar.Clock));
      end Print_Time_Stamp;

      procedure Print (Msg : String) is
      begin
         Print_Time_Stamp;
         Ada.Text_IO.Put_Line(Msg);
         Ada.Text_IO.New_Line;
      end Print;
   end Printer;

   task Task1;
   task Task2;
   task Task3;

   task body Task1 is
   begin
      for I in 1..5 loop
         Printer.Print("Task 1: Message " & Integer'Image(I));
         delay 0.7;
      end loop;
   end Task1;

   task body Task2 is
   begin
      for I in 1..5 loop
         Printer.Print("Task 2: Message " & Integer'Image(I));
         delay 1.2;
      end loop;
   end Task2;

   task body Task3 is
   begin
      for I in 1..5 loop
         Printer.Print("Task 3: Message " & Integer'Image(I));
         delay 0.9;
      end loop;
   end Task3;

begin
   Ada.Text_IO.Put_Line("Starting parallel tasks...");
   delay 6.0;  -- 等待所有任务完成
   Ada.Text_IO.Put_Line("All tasks completed.");
end Parallel_Tasks;