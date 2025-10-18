import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Random;
import java.util.concurrent.CompletableFuture;

public class NetworkRequest {
    
    // 模拟协程发起网络请求
    public static CompletableFuture<String> fetchDataAsync() {
        return CompletableFuture.supplyAsync(() -> {
            try {
                HttpClient client = HttpClient.newHttpClient();
                HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create("https://httpbin.org/get"))
                    .build();
                
                HttpResponse<String> response = client.send(request, 
                    HttpResponse.BodyHandlers.ofString());
                
                return "Network response status: " + response.statusCode() + 
                       ", body length: " + response.body().length() + " characters";
            } catch (Exception e) {
                return "Error occurred: " + e.getMessage();
            }
        });
    }

    // 生成随机文件名
    public static String generateRandomFileName() {
        String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 10; i++) {
            sb.append(chars.charAt(random.nextInt(chars.length())));
        }
        return sb.toString() + ".kt";
    }

    // 保存数据到随机命名的.kt文件
    public static String saveDataToFile(String data) throws IOException {
        String randomFileName = generateRandomFileName();
        File file = new File("/workspace/" + randomFileName);
        try (FileWriter writer = new FileWriter(file)) {
            writer.write(data);
        }
        return file.getAbsolutePath();
    }

    public static void main(String[] args) {
        System.out.println("发起网络请求...");
        
        // 使用CompletableFuture模拟协程行为
        CompletableFuture<String> future = fetchDataAsync();
        
        try {
            String data = future.join(); // 等待异步操作完成
            
            System.out.println("收到数据: " + data);
            
            // 保存到随机命名的.kt文件
            String filePath = saveDataToFile(data);
            System.out.println("数据已保存到: " + filePath);
        } catch (IOException e) {
            System.err.println("文件操作错误: " + e.getMessage());
        }
    }
}