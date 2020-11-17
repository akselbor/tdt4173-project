echo "Deploying to $# instances"

rm -r -f app/
mkdir app
cp -r ../data ./app
cp ../Project.ipynb ./app/notebook.ipynb
cp ./gserviceaccount-client-secret.json ./app

i=0

for var in $@ 
do
	action="tell app \"Terminal\" to do script \"cd \\\"$PWD\\\" && ./transfer.sh ${i} $# $var\""
	#echo osascript -e "$action"
	osascript -e "$action"
	i=$((i + 1))
done
