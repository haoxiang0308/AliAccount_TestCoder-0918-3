public class Student {
    // Fields to store student information
    private String name;
    private int age;
    private String studentId;
    private double gpa;

    // Constructor to initialize a Student object
    public Student(String name, int age, String studentId, double gpa) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.gpa = gpa;
    }

    // Getter method for name
    public String getName() {
        return name;
    }

    // Setter method for name
    public void setName(String name) {
        this.name = name;
    }

    // Getter method for age
    public int getAge() {
        return age;
    }

    // Setter method for age
    public void setAge(int age) {
        if (age > 0) { // Basic validation
            this.age = age;
        }
    }

    // Getter method for studentId
    public String getStudentId() {
        return studentId;
    }

    // Setter method for studentId
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    // Getter method for gpa
    public double getGpa() {
        return gpa;
    }

    // Setter method for gpa
    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) { // Basic validation for GPA
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

    // A simple method to check if the student is on the honor roll
    public boolean isHonorRoll() {
        return this.gpa >= 3.5;
    }

    // Main method for testing the Student class
    public static void main(String[] args) {
        // Create a new Student object
        Student student1 = new Student("Alice Johnson", 20, "S12345", 3.75);

        // Display the student's information
        student1.displayInfo();

        // Check if the student is on the honor roll
        if (student1.isHonorRoll()) {
            System.out.println(student1.getName() + " is on the honor roll!");
        } else {
            System.out.println(student1.getName() + " is not on the honor roll.");
        }

        // Modify the student's GPA
        student1.setGpa(2.9);

        System.out.println("\nAfter updating GPA:");
        student1.displayInfo();

        if (student1.isHonorRoll()) {
            System.out.println(student1.getName() + " is on the honor roll!");
        } else {
            System.out.println(student1.getName() + " is not on the honor roll.");
        }
    }
}