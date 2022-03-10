val tweetRDD = sc.textFile("tweets.tsv");
val wordlist = List("the", "wordle", "play");

val wcl = wordlist.map(word => (word, tweetRDD.map(line => line.split("\t")(4)).filter(tweet_text => tweet_text.toLowerCase().contains(word)).count()));

val wcl_sort = wcl.sortBy(-_._2);
wcl_sort.foreach(println);
