public class Student_9573 {
    // Private fields to store student information
    private String name;
    private int age;
    private String studentId;

    // Constructor to initialize the student object
    public Student_9573(String name, int age, String studentId) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
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

    // A method to display student information
    public void displayInfo() {
        System.out.println("Student Name: " + name);
        System.out.println("Student Age: " + age);
        System.out.println("Student ID: " + studentId);
    }

    // Main method for testing the Student class
    public static void main(String[] args) {
        Student_9573 student1 = new Student_9573("Alice", 20, "S001");
        student1.displayInfo();

        System.out.println("\nUpdating student information...");
        student1.setAge(21);
        student1.displayInfo();
    }
}