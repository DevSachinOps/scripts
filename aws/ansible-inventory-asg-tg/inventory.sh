#!/bin/bash

TG_ARN=$1
OUTFILE=$2

printf "[ASG]\n" > ${OUTFILE}
Instanceids=`aws elbv2 describe-target-health --target-group-arn $TG_ARN --query 'TargetHealthDescriptions[].Target[].Id' | jq '.[]' --raw-output`
for i in $Instanceids
do
aws ec2 describe-instances --instance-id=$i --output json --query 'Reservations[].Instances[].NetworkInterfaces[].PrivateIpAddress' | jq '.[0]' --raw-output
aws ec2 describe-instances --instance-id=$i --output json --query 'Reservations[].Instances[].NetworkInterfaces[].PrivateIpAddress' | jq '.[0]' --raw-output >> ${OUTFILE}
printf "" >> ${OUTFILE}
done
printf "Success! Created '${OUTFILE}' inventory-file .\n"
