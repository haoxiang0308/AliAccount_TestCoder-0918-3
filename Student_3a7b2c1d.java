public class Student_3a7b2c1d {
    // Fields to store student information
    private String name;
    private int age;
    private String studentId;
    private double gpa;

    // Constructor to initialize the student object
    public Student_3a7b2c1d(String name, int age, String studentId, double gpa) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.gpa = gpa;
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

    public double getGpa() {
        return gpa;
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

    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) { // Basic GPA validation
            this.gpa = gpa;
        }
    }

    // Method to display student information
    public void displayInfo() {
        System.out.println("Student Information:");
        System.out.println("Name: " + this.name);
        System.out.println("Age: " + this.age);
        System.out.println("Student ID: " + this.studentId);
        System.out.println("GPA: " + this.gpa);
    }

    // Main method for testing
    public static void main(String[] args) {
        Student_3a7b2c1d student1 = new Student_3a7b2c1d("Alice Johnson", 20, "S12345", 3.85);
        student1.displayInfo();

        System.out.println("\nUpdating GPA...");
        student1.setGpa(3.95);
        student1.displayInfo();
    }
}