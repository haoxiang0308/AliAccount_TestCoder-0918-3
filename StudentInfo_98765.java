public class StudentInfo_98765 {
    // 学生信息属性
    private String name;
    private int age;
    private String studentId;
    private String major;

    // 构造函数
    public StudentInfo_98765(String name, int age, String studentId, String major) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.major = major;
    }

    // Getter 方法
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

    // Setter 方法
    public void setName(String name) {
        this.name = name;
    }

    public void setAge(int age) {
        if (age > 0) { // 简单的验证
            this.age = age;
        }
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    // 自定义方法：获取学生简介
    public String getStudentBio() {
        return "学生 " + this.name + "，年龄 " + this.age + "，专业 " + this.major + "。";
    }

    // 主方法，用于测试
    public static void main(String[] args) {
        StudentInfo_98765 student1 = new StudentInfo_98765("张三", 20, "S001", "计算机科学");
        System.out.println(student1.getStudentBio());

        student1.setAge(21);
        System.out.println("更新后年龄: " + student1.getAge());
    }
}