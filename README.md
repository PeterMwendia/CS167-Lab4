# CS167-Lab4
## Hadoop MapReduce

This README provides instructions on how to compile and run a Hadoop MapReduce program using Apache Hadoop YARN.

### input files used:
1. sample file 1
   [nasa_19950801.tsv](nasa_19950801.tsv)

2. sample file 2
   [nasa_19950630.22-19950728.12.tsv.gz](https://drive.google.com/open?id=1pDNwfsx5jrAqaSy8AKEZyfubCE358L2p)


## Prerequisites

Before running the MapReduce program, ensure that you have the following prerequisites in place:

1. Apache Hadoop is installed and configured properly on your cluster.
2. Maven is installed on your system.
3. Java 11 jdk

## Compiling and Running the Program

1. Clone this Git repository to your local machine or upload your project code to your Hadoop cluster.

2. In the root directory of your project, create a `run.sh` script with the following content:
   
   If you already have a `run.sh` script, you can skip this step.

```bash
#!/bin/bash

# Step 1: Compile and package the project using Maven
mvn clean package

# Check if the Maven build was successful
if [ $? -ne 0 ]; then
  echo "Maven build failed. Exiting."
  exit 1
fi

# Step 2: Run the Hadoop MapReduce program using YARN
yarn jar target/lab4-1.0-SNAPSHOT.jar org.example.lab4.Filter hdfs:///user/<YourHDFSUsername>/nasa_19950801.tsv hdfs:///user/<YourHDFSUsername>/filter_output.tsv 200

# Check the status of the Hadoop job
if [ $? -ne 0 ]; then
  echo "Hadoop job failed. Exiting."
  exit 1
fi

echo "Hadoop job completed successfully."
```

3. Make the `run.sh` script executable by running the following command in your terminal:

```bash
chmod +x run.sh
```
Review the run.sh script to ensure it contains the correct commands for compiling and running your Hadoop MapReduce program. Make any necessary modifications to the script. You should also ensure that the desired response code is passed as a command-line argument.

Place the nasa_19950801.tsv input file in HDFS under the appropriate directory. You can use the following command to copy the file to HDFS:

```bash
hadoop fs -copyFromLocal /path/to/local/file/hdfs:/user/hadoop/
```

Replace /path/to/local/file/ with the local file path of nasa_19950801.tsv.

### Running the Program
To run the MapReduce program, execute the following command:

```bash
./run.sh
```
The run.sh script will automate the compilation and execution of the Hadoop MapReduce filter program. It includes error checking to ensure that both the Maven build and the Hadoop job run successfully.