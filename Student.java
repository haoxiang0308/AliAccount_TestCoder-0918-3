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

    // 默认构造函数
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
        if (gpa >= 0.0 && gpa <= 4.0) {  // GPA在0.0到4.0之间
            this.gpa = gpa;
        }
    }

    // 业务方法
    public boolean isExcellentStudent() {
        return gpa >= 3.5;
    }

    public String getStudentStatus() {
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

    public void study(String subject) {
        System.out.println(name + "正在学习" + subject);
    }

    public void takeExam(String subject) {
        System.out.println(name + "正在参加" + subject + "考试");
    }

    // 重写toString方法
    @Override
    public String toString() {
        return "Student{" +
                "姓名='" + name + '\'' +
                ", 年龄=" + age +
                ", 学号='" + studentId + '\'' +
                ", 专业='" + major + '\'' +
                ", GPA=" + gpa +
                ", 状态='" + getStudentStatus() + '\'' +
                '}';
    }

    // 主方法用于测试
    public static void main(String[] args) {
        // 创建学生对象
        Student student1 = new Student("张三", 20, "2021001", "计算机科学", 3.7);
        Student student2 = new Student("李四", 19, "2021002", "数学", 2.8);

        // 显示学生信息
        System.out.println(student1);
        System.out.println(student2);

        // 测试方法
        System.out.println("张三是否为优秀学生: " + student1.isExcellentStudent());
        System.out.println("李四的学习状态: " + student2.getStudentStatus());

        student1.study("Java编程");
        student2.takeExam("高等数学");
    }
}