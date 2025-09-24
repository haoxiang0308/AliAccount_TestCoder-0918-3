import java.util.ArrayList;
import java.util.List;

public class Student {
    private String name;
    private int age;
    private String studentId;
    private List<Double> grades;

    public Student(String name, int age, String studentId) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.grades = new ArrayList<>();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public List<Double> getGrades() {
        return grades;
    }

    public void addGrade(double grade) {
        if (grade >= 0.0 && grade <= 100.0) {
            this.grades.add(grade);
        } else {
            System.out.println("Invalid grade. Grade must be between 0.0 and 100.0.");
        }
    }

    public double calculateAverageGrade() {
        if (this.grades.isEmpty()) {
            return 0.0;
        }
        double sum = 0.0;
        for (double grade : this.grades) {
            sum += grade;
        }
        return sum / this.grades.size();
    }

    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", averageGrade=" + String.format("%.2f", calculateAverageGrade()) +
                '}';
    }

    public static void main(String[] args) {
        // Example usage
        Student student1 = new Student("Alice Johnson", 20, "S001");
        student1.addGrade(85.5);
        student1.addGrade(92.0);
        student1.addGrade(78.5);

        System.out.println(student1);
    }
}
