#!/bin/sh
pass=0
fail=0
TEST_1=$(find /home/user/.jenkins/secrets/initialAdminPassword | wc -l)
TEST_2=$(find /home/user/.jenkins/jobs/ES6Demo/builds -name build.xml -exec grep -o "SUCCESS" {} \; | wc -l)
TEST_3=$(find /home/user/.jenkins/jobs/ES6Demo/builds -name junitResult.xml| wc -l)
TEST_4=$(grep -io -e "*/5\s\*\s\*\s\*\s\*" -e "npm" -e "install" -e "test" -e "https://github.com/frescoplaylab/JenkinsES6.git" /home/user/.jenkins/jobs/ES6Demo/config.xml| wc -l)

if [ "$TEST_1" -eq 1 ]
then ((pass++))
else
    ((fail++))
fi;
if [ "$TEST_2" -eq 1 ]
then ((pass++))
else
    ((fail++))
fi;
if [ "$TEST_3" -eq 1 ]
then ((pass++))
else
    ((fail++))
fi;
if [ "$TEST_4" -ge 5 ]
then ((pass++))
else
    ((fail++))
fi;

echo "Total testcase: 4"
echo "Total testcase passed: $pass"
echo "Total testcase fail: $fail"
echo "total score: $(( ($pass * 100) / 4))"