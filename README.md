# Notepad

__Notepad__ is a *console based app*  which is used SQLite3 to store information, such as: link, text, post, memo and 
twitter posts. This app can also read information from database. You can use it to send tweets to your twitter, just 
need to set up your API keys. 

ver.: 0.9, 

Created by v.n.zubarev@gmail.com on 23/10/18

```
 require 'sqlite3'
 require 'optparse'
 require 'twitter'
```

1). First, clone this repo to your laptop or computer using terminal (command line): `git clone https://github.com/VovkaZy/notepad.git`

2). After this, change the directory to that, which contain game files: `cd dirpath/notepad/`

3). Set up your API keys for twitter [How To Link](https://bit.ly/2K6tLOD) : 
  ```  
   config.consumer_key = 'your_key'
   config.consumer_secret = 'your_secret'    
   config.access_token = 'your_token'
   config.access_token_secret = 'your_token_secret'
  ```  
     
4). If you want to read info from DB, just run in terminal (command line): `ruby read_db.rb`
> You can also see the options for reading DB

Run `ruby read_db.rb -h` and you'll see options:
```
Usage: read_db.db [options]
    -h, --help                       Prints this help
    -t, --type POST_TYPE             what kind of posts to show (default: any)
    -i, --id POST_ID                 if id set, show this post detailed
    -l, --limit NUMBER               how many last posts to show (default: all)
```


5). If you want to write something to DB, run in terminal (command line): `ruby write_to_db.rb`
> You will see such message:

```--------------------------------------------------------------
 Hi! What type of data you want to add? Choose a number (0 - 3)
 --------------------------------------------------------------
 	0. Memo
 	1. Task
 	2. Link
 	3. Tweet
 --------------------------------------------------------------
 Your choice number ->
 ```

Enter a number of your choice and follow the instructions depends on a type you choose.

7). Enjoy and have fun :)
