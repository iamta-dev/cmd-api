.PHONY: get-test

APP_BASE_URL=http://sit.ndid.co.th:4000/f65993877940c6c2550dd342

get-test:
	curl https://jsonplaceholder.typicode.com/users/1 | python3 -mjson.tool

get-idp:
	curl $(API_BAST_URL)/utility/idp | python3 -mjson.tool > ./response/idp.json








