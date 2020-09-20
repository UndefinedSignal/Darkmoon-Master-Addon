-------------------------------------------------------------------------------------------------------------
--
-- TrinityAdmin Version 3.x
-- TrinityAdmin is a derivative of MangAdmin.
--
-- Copyright (C) 2007 Free Software Foundation, Inc.
-- License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
-- This is free software: you are free to change and redistribute it.
-- There is NO WARRANTY, to the extent permitted by law.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--
-- Official Forums: http://groups.google.com/group/trinityadmin
-- GoogleCode Website: http://code.google.com/p/trinityadmin/
-- Subversion Repository: http://trinityadmin.googlecode.com/svn/
-- Dev Blog: http://trinityadmin.blogspot.com/
-------------------------------------------------------------------------------------------------------------
--[[
How to add a localised string:
1. Look below and find the functional area(Tab) your string belongs in.
2. In that section, find the appropriate type of string (Tooltip, Label, Other)
3. Each line is an assignment equation. On the left side is the 'token' which represents the string. The token is used
   in the source code, and is replaced by the actual string at runtime. The token is quoted, and contained in square brackets ([]).
   Eaxample: ["strength"]
4. Now assign a value to the token for the language you are working with. For example, if I am editing the enUS file, I want to 
   assign the value, in US English, to the token:
   ["strength"] = "Strength",
   Please note the line is terminated with a comma (,).
5. A given token must exist in all supported languages. If we edit the deDE file, we would use:
   ["strength"] = "Stärke",
6. Some of these lines also contain color codes (example: |cFF00FF00 and |r) Don't alter these, please.

TrinityAdmin Locale Team:
You have received this file which currently contains enUS strings, but will actually be the file for your 
selected language. 
1. Edit the first un-commented line below, which should resemble: function Return_enUS(). Change
   the 'enUS' to the four letter code for your locale (example: deDE).
2. Proceed to localisation by examining each line in the file, and altering the US English strings on 
   the RIGHT of each equation to your selected language. DO NOT alter anything on the LEFT sides 
   (the tokens). Example: ["token_do_not_edit"] = "Edit this string to your language",
3. Some text includes color codes:     ["info_revision"] = "|cFF00FF00Trinity Revision:|r ",
   The Color code should NOT be localised/edited. The color code is a tag, with an opening element 
   and a closing element. The opening element is "|c" followed by 8 numbers. The closing element
   is "|r". In the example above, "|cFF00FF00" and "|r" are the color code and should NOT be changed.
   That leaves "Trinity Revision:" as the string to edit in the above example.
4. Some strings may not be edited at all because they are used in code or contain code. They
   are marked.
5. Please do not edit comments. In LUA, the programming language we use here, code comments are seperated from code by the 
   use of "" (makes anything AFTER it a comment, to the end of the line) or comments
   can be enclosed between.

If you have any questions, contact iotech.
]]
function Return_enUS()
  return {
--[[Linkifier]]
    ["lfer_Spawn"] = "Spawn",
    ["lfer_List"] = "List",
    ["lfer_Reload"] = "Reload",
    ["lfer_Goto"] = "Goto",
    ["lfer_Move"] = "Move",
    ["lfer_Turn"] = "Turn",
    ["lfer_Delete"] = "Delete",
    ["lfer_Activate"] = "Activate",
    ["lfer_Teleport"] = "Teleport",
    ["lfer_GOBrotate"] = "Rotate",
    ["lfer_Pinfo"] = "PInfo",
    ["lfer_Morph"] = "Morph",
    ["made_by"] = "TestUnit",
    ["lfer_Add"] = "Add",
    ["lfer_Remove"] = "Remove",
    ["lfer_Learn"] = "Aura",
    ["lfer_Unlearn"] = "Unaura",
    ["lfer_Error"] = "Error Search String Matched but an error occured or unable to find type",
}
end
