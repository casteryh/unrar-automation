on run {input, parameters}
	repeat with file_to_handle in input
		#check if the file is password protected
		set file_posix to quoted form of POSIX path of file_to_handle
		set dir_posix to do shell script "dirname " & file_posix
		try
			do shell script "cd " & dir_posix & "; /usr/local/bin/unrar x -y " & file_posix
		on error err_message
			set pwd to text returned of (display dialog "please enter password for " & file_posix default answer "")
			do shell script "cd " & dir_posix & "; /usr/local/bin/unrar x -y -p" & pwd & " " & file_posix
		end try
	end repeat
end run