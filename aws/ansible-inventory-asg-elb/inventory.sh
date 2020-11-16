#!/bin/bash

OUTFILE=$2
ELB=$1

printf "[ASG]\n" > ${OUTFILE}
Instanceids=`aws elb describe-instance-health --load-balancer-name $ELB --query 'InstanceStates[].InstanceId' | jq '.[]' --raw-output`
for i in $Instanceids
do
aws ec2 describe-instances --instance-id=$i --output json --query 'Reservations[].Instances[].NetworkInterfaces[].PrivateIpAddress' | jq '.[0]' --raw-output
aws ec2 describe-instances --instance-id=$i --output json --query 'Reservations[].Instances[].NetworkInterfaces[].PrivateIpAddress' | jq '.[0]' --raw-output >> ${OUTFILE}
printf "" >> ${OUTFILE}
done
printf "Success! Created '${OUTFILE}' inventory-file .\n"
