/**
 * 学生类，用于存储和管理学生信息。
 */
public class Student_789xyz {

    // 私有成员变量
    private String name;
    private int age;
    private String studentId;

    /**
     * 构造函数
     * @param name 学生姓名
     * @param age 学生年龄
     * @param studentId 学生学号
     */
    public Student_789xyz(String name, int age, String studentId) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
    }

    // Getter 和 Setter 方法

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
        if (age > 0) { // 简单的验证
            this.age = age;
        }
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    /**
     * 打印学生信息
     */
    public void displayInfo() {
        System.out.println("学生信息:");
        System.out.println("  姓名: " + this.name);
        System.out.println("  年龄: " + this.age);
        System.out.println("  学号: " + this.studentId);
    }

    /**
     * 检查学生是否成年 (年龄 >= 18)
     * @return 如果成年返回 true，否则返回 false
     */
    public boolean isAdult() {
        return this.age >= 18;
    }

    // 主方法，用于演示
    public static void main(String[] args) {
        Student_789xyz student1 = new Student_789xyz("张三", 20, "S001");
        student1.displayInfo();
        System.out.println("是否成年: " + student1.isAdult());

        System.out.println("\n---\n");

        Student_789xyz student2 = new Student_789xyz("李四", 16, "S002");
        student2.displayInfo();
        System.out.println("是否成年: " + student2.isAdult());
    }
}