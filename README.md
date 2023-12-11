## Instructions to run the app

1. Clone the repository
2. run 'bundle install'
3. run 'ruby app.rb'

# Instructions for using the app

The app can be run automatically which is the default or it can be run manualy by using the '--manual' flag. That command would look like:
'ruby app.rb --manual'

When running the app in manual mode the user will need to use the up and down arrow keys to select actions and the app will perform those actions.
In manual mode you will be asked for a path for all file actions and will be asked for the desired change when modifying a file.

If you do not want to run the app manually you can run it in automatic mode which is the default. This will run all 5 actions with no user input needed and output the JSON.
If the user needs to run the automatic mode more than once they can use the '--times' flag and the number of times they wish to run the actions. That command could look like:
'ruby app.rb --times 5'

#### Sample Session:

```
AUTOMATIC MODE
ruby app.rb --times 5
hello world
hello world
hello world
hello world
hello world
{'activity':[{"time":"2023-12-11T10:20:05.223-07:00","user":"grady","process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:05.411-07:00","path":"C:/Users/grady/source/repos/edr_app/out.txt","type":"create","user":"grady","success":true,"process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:05.412-07:00","path":"C:/Users/grady/source/repos/edr_app/out.txt","type":"modify","user":"grady","success":true,"process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:05.412-07:00","path":"C:/Users/grady/source/repos/edr_app/out.txt","type":"delete","user":"grady","success":true,"process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:05.412-07:00","user":"grady","destination":["AF_INET6",80,"2607:f8b0:4005:812::2004","2607:f8b0:4005:812::2004"],"source":["AF_INET6",62640,"2605:a601:a989:4000:d8c2:7224:2a8e:87b6","2605:a601:a989:4000:d8c2:7224:2a8e:87b6"],"data_amount":58438,"data_protocol":"http","process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:05.600-07:00","user":"grady","process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:05.752-07:00","path":"C:/Users/grady/source/repos/edr_app/out.txt","type":"create","user":"grady","success":true,"process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:05.752-07:00","path":"C:/Users/grady/source/repos/edr_app/out.txt","type":"modify","user":"grady","success":true,"process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:05.752-07:00","path":"C:/Users/grady/source/repos/edr_app/out.txt","type":"delete","user":"grady","success":true,"process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:05.753-07:00","user":"grady","destination":["AF_INET6",80,"2607:f8b0:4005:812::2004","2607:f8b0:4005:812::2004"],"source":["AF_INET6",62641,"2605:a601:a989:4000:d8c2:7224:2a8e:87b6","2605:a601:a989:4000:d8c2:7224:2a8e:87b6"],"data_amount":58326,"data_protocol":"http","process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:05.905-07:00","user":"grady","process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:06.049-07:00","path":"C:/Users/grady/source/repos/edr_app/out.txt","type":"create","user":"grady","success":true,"process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:06.049-07:00","path":"C:/Users/grady/source/repos/edr_app/out.txt","type":"modify","user":"grady","success":true,"process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:06.049-07:00","path":"C:/Users/grady/source/repos/edr_app/out.txt","type":"delete","user":"grady","success":true,"process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:06.050-07:00","user":"grady","destination":["AF_INET6",80,"2607:f8b0:4005:812::2004","2607:f8b0:4005:812::2004"],"source":["AF_INET6",62642,"2605:a601:a989:4000:d8c2:7224:2a8e:87b6","2605:a601:a989:4000:d8c2:7224:2a8e:87b6"],"data_amount":58389,"data_protocol":"http","process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:06.498-07:00","user":"grady","process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:06.645-07:00","path":"C:/Users/grady/source/repos/edr_app/out.txt","type":"create","user":"grady","success":true,"process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:06.646-07:00","path":"C:/Users/grady/source/repos/edr_app/out.txt","type":"modify","user":"grady","success":true,"process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:06.646-07:00","path":"C:/Users/grady/source/repos/edr_app/out.txt","type":"delete","user":"grady","success":true,"process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:06.646-07:00","user":"grady","destination":["AF_INET6",80,"2607:f8b0:4005:812::2004","2607:f8b0:4005:812::2004"],"source":["AF_INET6",62643,"2605:a601:a989:4000:d8c2:7224:2a8e:87b6","2605:a601:a989:4000:d8c2:7224:2a8e:87b6"],"data_amount":58288,"data_protocol":"http","process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:06.794-07:00","user":"grady","process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:06.941-07:00","path":"C:/Users/grady/source/repos/edr_app/out.txt","type":"create","user":"grady","success":true,"process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:06.941-07:00","path":"C:/Users/grady/source/repos/edr_app/out.txt","type":"modify","user":"grady","success":true,"process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:06.941-07:00","path":"C:/Users/grady/source/repos/edr_app/out.txt","type":"delete","user":"grady","success":true,"process_name":"app.rb","process_id":10640,"process_command_line":null},{"time":"2023-12-11T10:20:06.942-07:00","user":"grady","destination":["AF_INET6",80,"2607:f8b0:4005:812::2004","2607:f8b0:4005:812::2004"],"source":["AF_INET6",62644,"2605:a601:a989:4000:d8c2:7224:2a8e:87b6","2605:a601:a989:4000:d8c2:7224:2a8e:87b6"],"data_amount":58809,"data_protocol":"http","process_name":"app.rb","process_id":10640,"process_command_line":null}]}

MANUAL MODE
ruby app.rb --manual
Hello and welcome to the EDR helper!
What is your name? grady
What can I help you with today? run an executeable
hello world
Is there eanything else I can help you with today? transmit data
Is there eanything else I can help you with today? create a file
What is the path for the file you want to create? out.txt
Is there eanything else I can help you with today? modify a file
What is the path for the file you want to modify? out.txt
What do you want the file to contain? hello world
Is there eanything else I can help you with today? delete a file
What is the path for the file you want to delete? out.txt
Is there eanything else I can help you with today? nothing
Have a nice day!
{'activity':[{"time":"2023-12-11T10:23:17.760-07:00","user":"grady","process_name":"app.rb","process_id":15888,"process_command_line":null},{"time":"2023-12-11T10:23:20.848-07:00","user":"grady","destination":["AF_INET6",80,"2607:f8b0:4005:802::2004","2607:f8b0:4005:802::2004"],"source":["AF_INET6",62667,"2605:a601:a989:4000:d8c2:7224:2a8e:87b6","2605:a601:a989:4000:d8c2:7224:2a8e:87b6"],"data_amount":58330,"data_protocol":"http","process_name":"app.rb","process_id":15888,"process_command_line":null},{"time":"2023-12-11T10:23:25.887-07:00","path":"C:/Users/grady/source/repos/edr_app/out.txt","type":"create","user":"grady","success":true,"process_name":"app.rb","process_id":15888,"process_command_line":null},{"time":"2023-12-11T10:23:42.317-07:00","path":"C:/Users/grady/source/repos/edr_app/out.txt","type":"modify","user":"grady","success":true,"process_name":"app.rb","process_id":15888,"process_command_line":null},{"time":"2023-12-11T10:23:46.046-07:00","path":"C:/Users/grady/source/repos/edr_app/out.txt","type":"delete","user":"grady","success":true,"process_name":"app.rb","process_id":15888,"process_command_line":null}]}
```
