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

    // 获取学生姓名
    public String getName() {
        return name;
    }

    // 设置学生姓名
    public void setName(String name) {
        this.name = name;
    }

    // 获取学生年龄
    public int getAge() {
        return age;
    }

    // 设置学生年龄
    public void setAge(int age) {
        this.age = age;
    }

    // 获取学生ID
    public String getStudentId() {
        return studentId;
    }

    // 设置学生ID
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    // 获取专业
    public String getMajor() {
        return major;
    }

    // 设置专业
    public void setMajor(String major) {
        this.major = major;
    }

    // 获取GPA
    public double getGpa() {
        return gpa;
    }

    // 设置GPA
    public void setGpa(double gpa) {
        this.gpa = gpa;
    }

    // 显示学生信息
    public void displayInfo() {
        System.out.println("学生信息:");
        System.out.println("姓名: " + name);
        System.out.println("年龄: " + age);
        System.out.println("学号: " + studentId);
        System.out.println("专业: " + major);
        System.out.println("GPA: " + gpa);
    }

    // 检查是否为优秀学生（GPA >= 3.5）
    public boolean isExcellentStudent() {
        return gpa >= 3.5;
    }

    // 更新GPA
    public void updateGpa(double newGpa) {
        if (newGpa >= 0.0 && newGpa <= 4.0) {
            this.gpa = newGpa;
            System.out.println("GPA已更新为: " + newGpa);
        } else {
            System.out.println("无效的GPA值，请输入0.0到4.0之间的数值。");
        }
    }

    // 重写toString方法
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

    // 主方法，用于测试
    public static void main(String[] args) {
        // 创建一个学生对象
        Student student = new Student("张三", 20, "2023001", "计算机科学", 3.7);
        
        // 显示学生信息
        student.displayInfo();
        
        // 检查是否为优秀学生
        if (student.isExcellentStudent()) {
            System.out.println(student.getName() + " 是优秀学生！");
        } else {
            System.out.println(student.getName() + " 不是优秀学生。");
        }
        
        // 更新GPA
        student.updateGpa(3.9);
        
        // 再次显示信息
        System.out.println("\n更新后的信息:");
        student.displayInfo();
    }
}