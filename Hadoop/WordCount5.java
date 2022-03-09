
import java.io.IOException;
import java.util.StringTokenizer;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class WordCount5 {

  public static class TokenizerMapper
       extends Mapper<Object, Text, Text, IntWritable>{

    private final static IntWritable one = new IntWritable(1);
    private Text word = new Text();

    public void map(Object key, Text value, Context context
                    ) throws IOException, InterruptedException {
      StringTokenizer itr = new StringTokenizer(value.toString());
     boolean justice = false;
     boolean citizen = false;
     boolean war = false;
     boolean hegemony = false;
     boolean nationality = false;

 while (itr.hasMoreTokens()) {
        String temp = itr.nextToken().replaceAll("\\p{Punct}","").toLowerCase();

        if(temp.equals("war")){
           war = true;
}else if(temp.equals("justice")){
         justice = true;
}else if(temp.equals("hegemony")){
         hegemony = true;
}else if(temp.equals("nationality")){
         nationality = true;
}
      }

if(justice && citizen && war && hegemony && nationality){
word.set("justice && citizen && war && hegemony && nationality");
        context.write(word, one);
} if(justice && citizen && war && hegemony){
word.set("justice && citizen && war && hegemony");
        context.write(word, one);
} if(justice && citizen && war){
word.set("justice && citizen && war");
        context.write(word, one);
} if(citizen && war && hegemony && nationality){
word.set("citizen && war && hegemony && nationality");
        context.write(word, one);
} if(citizen && war && hegemony){
word.set("citizen && war && hegemony");
        context.write(word, one);
} if(citizen && war && hegemony){
word.set("citizen && war && hegemony");
        context.write(word, one);
} if(citizen && war){
word.set("citizen && war");
        context.write(word, one);
} if(justice && war){
word.set("justice && war");
        context.write(word, one);
}

    }
  }

  public static class IntSumReducer
       extends Reducer<Text,IntWritable,Text,IntWritable> {
    private IntWritable result = new IntWritable();

    public void reduce(Text key, Iterable<IntWritable> values,
                       Context context
                       ) throws IOException, InterruptedException {
      int sum = 0;
      for (IntWritable val : values) {
        sum += val.get();
      }
      result.set(sum);
      context.write(key, result);
    }
  }

  public static void main(String[] args) throws Exception {
    Configuration conf = new Configuration();
    Job job = Job.getInstance(conf, "word count");
    job.setJarByClass(WordCount5.class);
    job.setMapperClass(TokenizerMapper.class);
    job.setCombinerClass(IntSumReducer.class);
    job.setReducerClass(IntSumReducer.class);
    job.setOutputKeyClass(Text.class);
    job.setOutputValueClass(IntWritable.class);
    FileInputFormat.addInputPath(job, new Path(args[0]));
    FileOutputFormat.setOutputPath(job, new Path(args[1]));
    System.exit(job.waitForCompletion(true) ? 0 : 1);
  }
}
