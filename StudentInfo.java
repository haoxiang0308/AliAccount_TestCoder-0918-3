/**
 * 学生信息类，包含学生的基本信息和相关方法
 */
public class StudentInfo {
    // 私有成员变量
    private String name;
    private int age;
    private String studentId;
    private String major;
    private double gpa;

    // 构造函数
    public StudentInfo(String name, int age, String studentId, String major, double gpa) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.major = major;
        this.gpa = gpa;
    }

    // 默认构造函数
    public StudentInfo() {
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
        if (age > 0 && age < 150) {  // 年龄合理性检查
            this.age = age;
        } else {
            System.out.println("输入的年龄不合理！");
        }
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) {  // GPA合理性检查
            this.gpa = gpa;
        } else {
            System.out.println("GPA应在0.0到4.0之间！");
        }
    }

    // 显示学生信息的方法
    public void displayInfo() {
        System.out.println("学生信息：");
        System.out.println("姓名：" + name);
        System.out.println("年龄：" + age);
        System.out.println("学号：" + studentId);
        System.out.println("专业：" + major);
        System.out.println("GPA：" + gpa);
    }

    // 计算学生等级的方法
    public String getGradeLevel() {
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

    // 检查学生是否及格
    public boolean isPassing() {
        return gpa >= 2.0;
    }

    // 更新GPA的方法
    public void updateGpa(double newGpa) {
        if (newGpa >= 0.0 && newGpa <= 4.0) {
            this.gpa = newGpa;
            System.out.println("GPA已更新为：" + newGpa);
        } else {
            System.out.println("无效的GPA值！");
        }
    }

    // 重写toString方法
    @Override
    public String toString() {
        return "StudentInfo{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", major='" + major + '\'' +
                ", gpa=" + gpa +
                '}';
    }

    // 重写equals方法
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        
        StudentInfo that = (StudentInfo) obj;
        
        return studentId.equals(that.studentId);
    }

    // 重写hashCode方法
    @Override
    public int hashCode() {
        return studentId.hashCode();
    }

    // 主方法，用于测试
    public static void main(String[] args) {
        // 创建一个学生对象
        StudentInfo student1 = new StudentInfo("张三", 20, "2021001", "计算机科学", 3.7);
        
        // 显示学生信息
        student1.displayInfo();
        
        System.out.println("\n等级：" + student1.getGradeLevel());
        System.out.println("是否及格：" + student1.isPassing());
        
        // 更新GPA
        student1.updateGpa(3.9);
        
        // 使用toString方法
        System.out.println("\n使用toString方法：" + student1.toString());
        
        // 创建另一个学生对象进行比较
        StudentInfo student2 = new StudentInfo("李四", 19, "2021002", "数学", 2.8);
        System.out.println("\n比较两个学生是否为同一人（基于学号）：");
        System.out.println("学生1学号：" + student1.getStudentId());
        System.out.println("学生2学号：" + student2.getStudentId());
        System.out.println("是否为同一人：" + student1.equals(student2));
    }
}