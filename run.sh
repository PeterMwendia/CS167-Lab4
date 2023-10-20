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
