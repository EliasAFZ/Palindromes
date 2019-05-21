with Ada.text_IO; use Ada.Text_IO;

package body wordPkg.Palindromes is

   -- Function to determine if word is a palindrome
   function is_Pal(w: word) return boolean is
      lastCharacter: Integer := w.Length;
   begin
      for i in w.Letters'First .. w.length/2 loop
         if(w.letters(i) /= w.letters(lastCharacter)) then
            return false;
         end if;
         lastCharacter := lastCharacter - 1;
      end loop;
      return True;
   end is_Pal;

end WordPkg.Palindromes;
