// Data fetched from https://httpbin.org/json
// Generated on 2025-10-13 18:35:24.343115

final Map<String, dynamic> fetchedData = {
  "slideshow": {
    "author": "Yours Truly", 
    "date": "date of publication", 
    "slides": [
      {
        "title": "Wake up to WonderWidgets!", 
        "type": "all"
      }, 
      {
        "items": [
          "Why <em>WonderWidgets</em> are great", 
          "Who <em>buys</em> WonderWidgets"
        ], 
        "title": "Overview", 
        "type": "all"
      }
    ], 
    "title": "Sample Slide Show"
  }
}
;

void printData() {
  print('Fetched Data: $fetchedData');
}
