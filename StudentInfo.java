import java.util.ArrayList;
import java.util.List;

public class StudentInfo {

    private String name;
    private int age;
    private String studentId;
    private List<Integer> grades;

    // Constructor
    public StudentInfo(String name, int age, String studentId) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.grades = new ArrayList<>();
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

    public List<Integer> getGrades() {
        return new ArrayList<>(grades); // Return a copy to maintain encapsulation
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

    // Method to add a grade
    public void addGrade(int grade) {
        if (grade >= 0 && grade <= 100) { // Basic validation for grade
            grades.add(grade);
        } else {
            System.out.println("Invalid grade. Grade must be between 0 and 100.");
        }
    }

    // Method to calculate average grade
    public double calculateAverageGrade() {
        if (grades.isEmpty()) {
            return 0.0;
        }
        int sum = 0;
        for (int grade : grades) {
            sum += grade;
        }
        return (double) sum / grades.size();
    }

    // Method to display student information
    public void displayInfo() {
        System.out.println("Student Information:");
        System.out.println("Name: " + name);
        System.out.println("Age: " + age);
        System.out.println("ID: " + studentId);
        System.out.println("Grades: " + grades);
        System.out.printf("Average Grade: %.2f%n", calculateAverageGrade());
    }

    // Main method for testing
    public static void main(String[] args) {
        StudentInfo student1 = new StudentInfo("Alice Johnson", 20, "S001");
        student1.addGrade(85);
        student1.addGrade(92);
        student1.addGrade(78);

        student1.displayInfo();

        System.out.println("\n--- Adding another grade ---");
        student1.addGrade(96);
        student1.displayInfo();
    }
}