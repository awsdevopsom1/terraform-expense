#! /bin/bash
yum install ansible python3.11-pip.noarch -y | tee -a /opt/userdata.log
pip3.11 install botocore boto3 | tee -a /opt/userdata.log
ansible-pull -i localhost, -U https://github.com/awsdevopsom1/expense-ansible.git expense.yml -e role_name=${role_name} env=${env} | tee -a /opt/userdata.log 
