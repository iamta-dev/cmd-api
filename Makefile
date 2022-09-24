.PHONY: get-test

# fix is my-pc
PUBLIC_KEY_PATH=/Users/tazgg/Documents/xspring/key/brokerage-ndid-node-dev.pem

EC2_USER=ec2-user
EC2_HOST=ec2-52-76-246-88.ap-southeast-1.compute.amazonaws.com
APP_BASE_URL=http://sit.ndid.co.th:4000/f65993877940c6c2550dd342

shell:
	ssh -i $(PUBLIC_KEY_PATH) -XY $(EC2_USER)@$(EC2_HOST)

dump-file:
	scp -i $(PUBLIC_KEY_PATH) -r $(EC2_USER)@$(EC2_HOST):/home/ec2-user/ndid-gateway/response/  ./

get-test:
	curl https://jsonplaceholder.typicode.com/users/1 | python3 -mjson.tool

get-idp:
	curl $(API_BAST_URL)/utility/idp | python3 -mjson.tool > ./response/idp.json








