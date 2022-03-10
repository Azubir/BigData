import java.time.LocalDate
import java.time.format.DateTimeFormatter

val tweetRDD = sc.textFile("tweets.tsv");
val topDate = tweetRDD.map(line => line.split("\t")(2)).map(date => (date, 1)).reduceByKey(_ + _).sortBy(T => T._2, false).first()
val pattern = java.time.format.DateTimeFormatter.ofPattern("u-M-d H:m:s+00:00")
val date = java.time.LocalDate.parse(topDate._1.toString, pattern)
date.getDayOfWeek
