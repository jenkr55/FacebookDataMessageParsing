# FacebookDataMessageParsing
Parse your facebook data into a CSV of your message frequency, friend request frequency, or timeline activity frequency. The CSV is formatted with Name, Frequency, and Month in each row. From there you can input the data into Excel or another program and analyze it or make charts!

## Setup
0. Download Ruby if you don't have it yet. 
1. Go to your [Facebook Settings](https://www.facebook.com/settings) and click "Download a copy of your Facebook data"
2. Wait for them to email you when the download is ready
3. Download the data into a directory. Then, clone this repo into the same directory.
4. Change your path and name variables in the file
5. For message data, run `ruby script.rb` from the directory the script is in. It will finish and dump the data into a CSV. Depending how much data you have, it could take from a few minutes up to tens of minutes.
6. To parse the friends page into a CSV of name and date, change the file path in `friendscript.rb` and then run `ruby friendscript.rb`
7. To get a list of dates of timeline activity, change the file path in `timelinescript.rb`, and run `ruby timelinescript.rb`
