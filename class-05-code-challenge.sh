prompt="     ☠︎ \e[31mYOU HAVE LAUNCED PID SUPER KILLER\e[0m☠︎\nEnter PID to kill a process or press 'ctrl+C' to exit."
# there is no PID 0
PID=0

until [ $PID == "exit" ]
do
# ps -aux  will show processes running
    ps aux
# here echo grabs the string above asking the user to either enter a PID to kill or exit the program    
    echo -e $prompt
# read allows for imput from the user.  Here it is asking for a PID   
    read PID
# this sudo command "kill -9" is used to kill processes    
    sudo kill -9 $PID
    
done