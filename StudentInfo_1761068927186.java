public class Student {
    // 学生属性
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
        if (age > 0) {
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
        if (gpa >= 0.0 && gpa <= 4.0) {
            this.gpa = gpa;
        }
    }

    // 业务方法
    public boolean isExcellentStudent() {
        return gpa >= 3.5;
    }

    public String getStudentLevel() {
        if (gpa >= 3.7) {
            return "A+";
        } else if (gpa >= 3.3) {
            return "A";
        } else if (gpa >= 3.0) {
            return "B+";
        } else if (gpa >= 2.7) {
            return "B";
        } else if (gpa >= 2.0) {
            return "C";
        } else {
            return "F";
        }
    }

    public void displayStudentInfo() {
        System.out.println("学生信息:");
        System.out.println("姓名: " + name);
        System.out.println("年龄: " + age);
        System.out.println("学号: " + studentId);
        System.out.println("专业: " + major);
        System.out.println("GPA: " + gpa);
        System.out.println("等级: " + getStudentLevel());
        System.out.println("是否优秀学生: " + (isExcellentStudent() ? "是" : "否"));
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
        // 创建学生对象
        Student student1 = new Student("张三", 20, "2021001", "计算机科学", 3.8);
        Student student2 = new Student("李四", 19, "2021002", "数学", 3.2);

        // 显示学生信息
        student1.displayStudentInfo();
        System.out.println();
        student2.displayStudentInfo();

        // 测试getter和setter方法
        System.out.println("\n使用getter和setter方法:");
        System.out.println("学生1姓名: " + student1.getName());
        System.out.println("学生1是否为优秀学生: " + student1.isExcellentStudent());
    }
}