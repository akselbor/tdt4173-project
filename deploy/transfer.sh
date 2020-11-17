echo "($1/$2): $3"
ssh -i "aws-key.pem" ec2-user@"$3" 'rm -r ~/img/'
scp -i "aws-key.pem" -r app/ ec2-user@"$3":~/img
ssh -i "aws-key.pem" ec2-user@"$3" "bash -s $1 $2" < build_and_exec.sh