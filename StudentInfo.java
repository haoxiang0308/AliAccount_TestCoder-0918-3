import java.util.ArrayList;
import java.util.List;

public class StudentInfo {

    private String name;
    private int age;
    private String studentId;
    private List<String> courses;

    public StudentInfo(String name, int age, String studentId) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.courses = new ArrayList<>();
    }

    // Getter methods
    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public String getStudentId() {
        return studentId;
    }

    public List<String> getCourses() {
        return new ArrayList<>(courses); // Return a copy to maintain encapsulation
    }

    // Setter methods
    public void setName(String name) {
        this.name = name;
    }

    public void setAge(int age) {
        if (age > 0) { // Basic validation
            this.age = age;
        }
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    // Method to add a course
    public void enrollCourse(String courseName) {
        if (!courses.contains(courseName)) {
            courses.add(courseName);
        }
    }

    // Method to drop a course
    public void dropCourse(String courseName) {
        courses.remove(courseName);
    }

    // Method to display student information
    public void displayInfo() {
        System.out.println("Student Information:");
        System.out.println("Name: " + this.name);
        System.out.println("Age: " + this.age);
        System.out.println("ID: " + this.studentId);
        System.out.println("Enrolled Courses: " + this.courses);
    }

    public static void main(String[] args) {
        // Example usage
        StudentInfo student = new StudentInfo("Alice Johnson", 20, "S001");

        student.enrollCourse("Mathematics");
        student.enrollCourse("Physics");
        student.dropCourse("Mathematics");
        student.enrollCourse("Chemistry");

        student.displayInfo();
    }
}