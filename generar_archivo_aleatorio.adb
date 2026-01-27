with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
with Ada.Calendar;

procedure GenerarArchivoAleatorio is

   package Random_Names is new Ada.Numerics.Discrete_Random (Character);
   Gen : Random_Names.Generator;

   -- Función para generar un nombre aleatorio
   function GenerarNombreAleatorio return String is
      Result : String (1 .. 8);
   begin
      for I in Result'Range loop
         Result(I) := Random_Names.Random (Gen);
      end loop;
      return Result & ".txt";
   end GenerarNombreAleatorio;

   -- Procedimiento que imprime un mensaje y lo guarda en archivo
   procedure ImprimirYGuardar(Mensaje : String; FileName : String) is
      File : File_Type;
   begin
      -- Imprimir en consola
      Put_Line ("Mensaje: " & Mensaje);
      
      -- Guardar en archivo
      Create (File, Out_File, FileName);
      begin
         Put_Line (File, Mensaje);
      finally
         Close (File);
      end;
      
      Put_Line ("Archivo guardado: " & FileName);
   end ImprimirYGuardar;

begin
   -- Inicializar generador de números aleatorios usando la hora actual
   Random_Names.Reset (Gen, 
                       Ada.Calendar.Seconds (Ada.Calendar.Clock),
                       Ada.Calendar.Seconds (Ada.Calendar.Clock));
   
   -- Generar nombre aleatorio
   declare
      NombreArchivo : constant String := GenerarNombreAleatorio;
   begin
      -- Llamar al procedimiento con un mensaje
      ImprimirYGuardar("Hola Mundo! Este es un mensaje generado por Ada.", NombreArchivo);
   end;
end GenerarArchivoAleatorio;