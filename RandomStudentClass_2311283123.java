public class Student {
    // 私有成员变量
    private String name;
    private int age;
    private String studentId;
    private double gpa;
    private String major;

    // 构造函数
    public Student(String name, int age, String studentId, double gpa, String major) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.gpa = gpa;
        this.major = major;
    }

    // 默认构造函数
    public Student() {
        this.name = "";
        this.age = 0;
        this.studentId = "";
        this.gpa = 0.0;
        this.major = "";
    }

    // Getter方法
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

    public String getMajor() {
        return major;
    }

    // Setter方法
    public void setName(String name) {
        this.name = name;
    }

    public void setAge(int age) {
        if (age > 0) {
            this.age = age;
        }
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) {
            this.gpa = gpa;
        }
    }

    public void setMajor(String major) {
        this.major = major;
    }

    // 显示学生信息的方法
    public void displayInfo() {
        System.out.println("学生信息:");
        System.out.println("姓名: " + name);
        System.out.println("年龄: " + age);
        System.out.println("学号: " + studentId);
        System.out.println("GPA: " + gpa);
        System.out.println("专业: " + major);
    }

    // 计算成绩等级的方法
    public String getGradeLevel() {
        if (gpa >= 3.7) {
            return "A";
        } else if (gpa >= 3.0) {
            return "B";
        } else if (gpa >= 2.0) {
            return "C";
        } else if (gpa >= 1.0) {
            return "D";
        } else {
            return "F";
        }
    }

    // 判断是否为优秀学生
    public boolean isExcellentStudent() {
        return gpa >= 3.5;
    }

    // 重写toString方法
    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", gpa=" + gpa +
                ", major='" + major + '\'' +
                '}';
    }

    // 重写equals方法
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        
        Student student = (Student) obj;
        
        return studentId != null ? studentId.equals(student.studentId) : student.studentId == null;
    }

    // 重写hashCode方法
    @Override
    public int hashCode() {
        return studentId != null ? studentId.hashCode() : 0;
    }
}