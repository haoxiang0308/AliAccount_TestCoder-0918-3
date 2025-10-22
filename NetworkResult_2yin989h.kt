        // 网络请求结果保存
        val requestUrl = "https://httpbin.org/get"
        val response = "{
  "args": {}, 
  "headers": {
    "Accept": "text/html, image/gif, image/jpeg, */*; q=0.2", 
    "Host": "httpbin.org", 
    "User-Agent": "Java/17.0.16", 
    "X-Amzn-Trace-Id": "Root=1-68f8a642-3feb87db0581580c215d5248"
  }, 
  "origin": "47.237.148.198", 
  "url": "https://httpbin.org/get"
}
"
        val timestamp = "1761125955385"
        
        fun getRequestInfo(): String {
            return "URL: " + requestUrl + "\\nResponse: " + response + "\\nTimestamp: " + timestamp
        }