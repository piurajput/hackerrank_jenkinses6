#!/bin/sh
SCORE=0
TEST_1=$(find /home/user/.jenkins/secrets/initialAdminPassword | wc -l)
TEST_2=$(find /home/user/.jenkins/jobs/ES6Demo/builds -name build.xml -exec grep -o "SUCCESS" {} \; | wc -l)
TEST_3=$(find /home/user/.jenkins/jobs/ES6Demo/builds -name junitResult.xml| wc -l)
TEST_4=$(grep -io -e "*/5\s\*\s\*\s\*\s\*" -e "npm" -e "install" -e "test" -e "https://github.com/frescoplaylab/JenkinsES6.git" /home/user/.jenkins/jobs/ES6Demo/config.xml| wc -l)

if [ "$TEST_1" -eq 1 ]
then SCORE=$(($SCORE + 15))
fi;
if [ "$TEST_2" -eq 1 ]
then SCORE=$(($SCORE + 20))
fi;
if [ "$TEST_3" -eq 1 ]
then SCORE=$(($SCORE + 30))
fi;
if [ "$TEST_4" -ge 5 ]
then SCORE=$(($SCORE + 35))
fi;
echo "FS_SCORE:$SCORE%"  