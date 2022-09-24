.PHONY: get-test

# Fix to path my-pc
PUBLIC_KEY_PATH=/Users/tazgg/Documents/xspring/key/brokerage-ndid-node-dev.pem

EC2_USER=ec2-user
EC2_HOST=ec2-52-76-246-88.ap-southeast-1.compute.amazonaws.com
APP_BASE_URL=http://sit.ndid.co.th:4000/f65993877940c6c2550dd342

# Use cmd on pc
shell:
	ssh -i $(PUBLIC_KEY_PATH) -XY $(EC2_USER)@$(EC2_HOST)

dump-file:
	scp -i $(PUBLIC_KEY_PATH) -r $(EC2_USER)@$(EC2_HOST):/home/ec2-user/ndid-gateway/response/  ./

get-test:
	curl --request GET \
  		--url https://jsonplaceholder.typicode.com/users/1 \
  		--header "accept-language: en-US,en;q=0.9,th;q=0.8" \
  		--header "content-type: application/json;charset=UTF-8" \
		| python3 -mjson.tool

post-test:
	curl --request POST \
  		--url https://jsonplaceholder.typicode.com/posts \
  		--header "accept-language: en-US,en;q=0.9,th;q=0.8" \
  		--header "content-type: application/json;charset=UTF-8" \
  		--data '{"userId": 1,"title": "xxxx","body": "xxxxx"}' \
		| python3 -mjson.tool

# Use cmd on remote-server 
get-idp:
	curl --request GET \
  		--url $(APP_BASE_URL)/utility/idp \
  		--header "accept-language: en-US,en;q=0.9,th;q=0.8" \
  		--header "content-type: application/json;charset=UTF-8" \
		| python3 -mjson.tool

save-idp:
	curl --request GET \
  		--url $(APP_BASE_URL)/utility/idp \
  		--header "accept-language: en-US,en;q=0.9,th;q=0.8" \
  		--header "content-type: application/json;charset=UTF-8" \
		| python3 -mjson.tool > ./response/idp.json









