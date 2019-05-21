with Ada.Text_IO; use Ada.Text_IO;
with Ada.Characters.Handling; use Ada.Characters.Handling;

package body wordPkg.wordops is

   -- Function to convert a string to all uppercase
   function to_Upper(w: word) return word is
   begin
      return New_Word(To_Upper(w.Letters(1..w.Length)));
   end to_Upper;

   -- Procedure to convert string to uppercase however was not needed
   procedure to_Upper(w: in out word) is
   begin
      w := New_Word(To_Upper(w.Letters(1..w.Length)));
   end to_Upper;

   -- Function to remove non letters and return a string
   function remove_Nonletter(w: word) return word is
      cleanedStr: String(1..w.Length);
      lettersFound: Integer := 0;
   begin
      for i in w.Letters'First .. w.length loop
         if Is_Letter(w.letters(i)) then
            lettersFound := lettersFound + 1;
            cleanedStr(lettersFound) := w.Letters(i);
         end if;
      end loop;
      return New_Word(cleanedStr(1..lettersFound));
   end remove_Nonletter;

   -- Procedure to remove nonletters however was not needed
   procedure remove_NonLetter(w: in out word) is
      cleanedStr: String(1..w.Length);
      lettersFound: Integer := 0;
   begin
      for i in w.Letters'First .. w.length loop
         if Is_Letter(w.letters(i)) then
            lettersFound := lettersFound + 1;
            cleanedStr(lettersFound) := w.Letters(i);
         end if;
      end loop;
   end remove_NonLetter;
end wordPkg.wordops;
