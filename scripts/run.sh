#!/usr/bin/env sh

echo "Getting all files in the directory"

ls -l

# Run the dotnet app
dotnet run GraphQL.NET.sln

#install newman
npm install -g newman
#Run newman collection and environment
newman run postman/collection.json -e postman/environment.json --reporters cli --insecure

if [ $? -eq 0 ] 
then 
  echo "Successfully executed newman test" 
  exit 0 
else 
  echo "Failing executing newman test" >&2 
  exit 1 
fi

