# Sentiment-Analyser
https://sentimentanalyser.pythonanywhere.com/

It is the website which measure sentiment of the text that is written in his input field.
The website show whether the statement is positive or negative.
for example:
1:John is a nice guy:It show that it is a positive statement.
2:Jhon is bad guy : It will show that it is negative sentence.

#How it works?
It has all the negative words stored init in a List.
when any negative word from the dictionary matches it returns the negative sentence.



Created with Flask Framework.
![image](https://user-images.githubusercontent.com/56790330/94359815-d317a980-00c6-11eb-8573-567209ec143b.png)
![image](https://user-images.githubusercontent.com/56790330/94359857-13772780-00c7-11eb-87ea-b56cb2df4648.png)

docker cmd: 
 #docker build -t imagename .
 # docker run -td --name senticontainer -p 80:8000 sentiimage

Created by:Ketan Gupta
