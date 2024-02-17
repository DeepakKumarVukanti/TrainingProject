function fn(){
	var config = {
		baseURL : 'https://reqres.in/api'
	};
	
	karate.configure('connectTimeout', 5000)
	karate.configure('readTimeout', 5000)
	return config;
}