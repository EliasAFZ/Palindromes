-- Name: Elias Afzalzada
-- Email: eafzalzada@radford.edu
-- Course: Itec 320
-- Homework #: 6
-- Link: https://www.radford.edu/~itec320//2018fall-ibarland/Homeworks/pals/
-- Purpose: Checks if input is a Palindrome with generic and child packages

with Ada.Text_IO; use Ada.Text_IO;
with WordPkg;
with WordPkg.Palindromes;
with WordPkg.wordops;
procedure Pals is

   -- Sets maximum word capacity
   maxwordSize: Natural := 15;

   -- Sets up generic parent package
   package wordpak is new WordPkg(maxwordSize);
   use wordpak;

   -- Sets up generic child packagee
   package palinchk is new wordpak.Palindromes;
   use palinchk;

   -- Sets up generic child package
   package wordOpertations is new wordpak.wordops;
   use wordOpertations;

   --Gets input from user via stdin, processes input, then outputs to console
   procedure getProcessOut is
      --Sets up words to be passed around and evaluated;
      orginalWord: word;
      upperWord: word;
      removedNonLettersWord: word;
      upperWordandRemoveNonLetters: word;

   begin
      -- Control loop for looking through file
      while not End_Of_File loop

         --Exception handler to check if word is over capacity
         WordTooLong:
         begin
            Get(orginalWord);
         exception
            when others =>
               put_line("Warning Exception: Entered word is over max capacity");
               New_Line;
         end WordTooLong;

         upperWord := to_Upper(orginalWord);
         removedNonLettersWord := remove_NonLetter(orginalWord);
         upperWordandRemoveNonLetters := remove_NonLetter(upperWord);

         -- if condition, if the original word entered is a palindrome
         if is_Pal(orginalWord) = true then
            put("String: ");
            Put(orginalWord);
            New_Line;
            Put_Line("Status: Palindrome as is");
            New_Line;

            -- elsif condition, if the word can be "uppercased" to a palindrome
         elsif is_Pal(removedNonLettersWord) = true then
            put("String: ");
            Put(orginalWord);
            New_Line;
            Put_Line("Status: Palindrome when non-letters are removed");
            put("PalStr: ");
            Put(removedNonLettersWord);
            New_Line(2);

            -- elsif condition, if the word can be cleaned of nonletters to a palindrome
         elsif is_Pal(upperWord) = true then
            put("String: ");
            Put(orginalWord);
            New_Line;
            Put_Line("Status: Palindrome when converted to upper case");
            put("PalStr: ");
            Put(upperWord);
            New_Line(2);

            -- elsif condition, if the word can be cleaned and "uppercased" to a palindrome
         elsif is_Pal(upperWordandRemoveNonLetters) = true then
            put("String: ");
            Put(orginalWord);
            New_Line;
            Put_Line("Status: Palindrome when converted to upper case and non-letters are removed");
            put("PalStr: ");
            Put(upperWordandRemoveNonLetters);
            New_Line(2);

            -- Condition if the word is never a palindrome
         else
            put("String: ");
            Put(orginalWord);
            New_Line;
            Put_Line("Status: Never a palindrome");
         end if;
      end loop;
   end getProcessOut;

begin
   getProcessOut;
end Pals;
