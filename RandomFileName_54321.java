import java.util.ArrayList;
import java.util.List;

class StudentInfo {
    private String name;
    private int age;
    private String studentId;
    private List<Double> grades;

    public StudentInfo(String name, int age, String studentId) {
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
        return "StudentInfo{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", averageGrade=" + String.format("%.2f", calculateAverageGrade()) +
                '}';
    }

    public static void main(String[] args) {
        // Example usage
        StudentInfo student1 = new StudentInfo("Bob Smith", 21, "S002");
        student1.addGrade(90.0);
        student1.addGrade(87.5);
        student1.addGrade(95.0);

        System.out.println(student1);
    }
}
