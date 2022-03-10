var tweets =spark.read.format("com.databricks.spark.csv").option("header", "true").option("inferSchema","true").option("delimiter", "\t").load("/tweets.tsv")
