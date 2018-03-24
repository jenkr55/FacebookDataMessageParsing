# FacebookDataMessageParsing
Parse your facebook data into a CSV of your message frequency, friend request frequency, or timeline activity frequency. From there you can input the data into Excel or another program to analyze it or make charts!

If Facebook changes their format for downloaded data, these scripts may break. Let me know by submitting an issue or a pull request!

## Setup
0. Download Ruby if you don't have it yet. 
1. Go to your [Facebook Settings](https://www.facebook.com/settings) and click "Download a copy of your Facebook data"
2. Wait for them to email you when the download is ready
3. Download the data into a directory. Then, clone this repo into the same directory.
4. For message data, change the variables in `script.rb` and then run `ruby script.rb` from the directory the script is in. It will finish and dump the data into a CSV. Depending how much data you have, it could take from a few minutes up to tens of minutes.
5. To parse the friends page into a CSV of name and date, change the file path in `friendscript.rb` and then run `ruby friendscript.rb`
6. To get a list of dates of timeline activity, change the file path in `timelinescript.rb`, and run `ruby timelinescript.rb`
