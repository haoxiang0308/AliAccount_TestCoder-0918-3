import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

public class TestRunner {
    public static void main(String[] args) {
        // The test class name will be passed dynamically
        String testClassName = System.getProperty("testClass", "CalculatorAddTest");
        try {
            Class<?> testClass = Class.forName(testClassName);
            Result result = JUnitCore.runClasses(testClass);
            for (Failure failure : result.getFailures()) {
                System.out.println(failure.toString());
            }
            if (result.wasSuccessful()) {
                System.out.println("All tests passed.");
            } else {
                System.out.println("Tests failed.");
            }
        } catch (ClassNotFoundException e) {
            System.err.println("Test class not found: " + e.getMessage());
        }
    }
}