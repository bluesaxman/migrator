# migrator
An easy automated way to migrate (From most) hosting accounts to a cpanel hosting account. <br>
<br>
Description:<br>
This projects aim is to create an automated way to move a hosting account from one host to another with only the knowledge of what the SSH logins for both accounts are.<br> 
<br>
Requirements:<br>
SSH access on both hosting accounts.<br>
cPanel on the hosting account you are moving to.<br>
Twocows email on the hosting account you are moving to.<br>

<br>
Syntax:<br>
migrator.sh -i &lt;IP Address&gt;:&lt;Username&gt;:&lt;Password&gt; -o &lt;IP Address&gt;:&lt;Username&gt;:&lt;Password&gt;
<br>
-i    The old hosting account<br>
-o    The new hosting account<br>
<br>
Each account is represented by a string containing the IP User and password. seperated by a : <br>
<br>
Notes:<br>
I'm originally writing this in bash for protibility, however I intend (for my own education) to write versions of this in perl and in c as well. 
