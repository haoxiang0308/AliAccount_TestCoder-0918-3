public class Student {
    // 私有属性
    private String name;
    private int age;
    private String studentId;
    private String major;
    private double gpa;

    // 构造函数
    public Student(String name, int age, String studentId, String major, double gpa) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.major = major;
        this.gpa = gpa;
    }

    // 无参构造函数
    public Student() {
        this.name = "";
        this.age = 0;
        this.studentId = "";
        this.major = "";
        this.gpa = 0.0;
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

    public String getMajor() {
        return major;
    }

    public double getGpa() {
        return gpa;
    }

    // Setter方法
    public void setName(String name) {
        this.name = name;
    }

    public void setAge(int age) {
        if (age > 0) {  // 年龄必须大于0
            this.age = age;
        }
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) {  // GPA在0-4之间
            this.gpa = gpa;
        }
    }

    // 业务方法
    public String getStudentInfo() {
        return "学生信息:\n" +
               "姓名: " + name + "\n" +
               "年龄: " + age + "\n" +
               "学号: " + studentId + "\n" +
               "专业: " + major + "\n" +
               "GPA: " + gpa;
    }

    public boolean isExcellentStudent() {
        return gpa >= 3.5;
    }

    public int getGraduationYear(int currentYear) {
        // 假设学制为4年
        return currentYear + 4;
    }

    public String getAcademicStatus() {
        if (gpa >= 3.5) {
            return "优秀";
        } else if (gpa >= 3.0) {
            return "良好";
        } else if (gpa >= 2.0) {
            return "及格";
        } else {
            return "不及格";
        }
    }

    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", major='" + major + '\'' +
                ", gpa=" + gpa +
                '}';
    }

    // 主方法用于测试
    public static void main(String[] args) {
        // 创建一个学生对象
        Student student = new Student("张三", 20, "2021001", "计算机科学", 3.7);
        
        // 输出学生信息
        System.out.println(student.getStudentInfo());
        System.out.println("\n是否为优秀学生: " + student.isExcellentStudent());
        System.out.println("预计毕业年份: " + student.getGraduationYear(2024));
        System.out.println("学术状态: " + student.getAcademicStatus());
        System.out.println("\n对象信息: " + student.toString());
    }
}