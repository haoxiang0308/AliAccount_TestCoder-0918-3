public class Student333 {
    // 学生属性
    private String name;
    private int age;
    private String studentId;
    private String major;
    private double gpa;
    
    // 构造方法
    public Student333() {
        this.name = "";
        this.age = 0;
        this.studentId = "";
        this.major = "";
        this.gpa = 0.0;
    }
    
    public Student333(String name, int age, String studentId, String major, double gpa) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.major = major;
        this.gpa = gpa;
    }
    
    // 访问器方法 (Getters)
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
    
    // 修改器方法 (Setters)
    public void setName(String name) {
        this.name = name;
    }
    
    public void setAge(int age) {
        this.age = age;
    }
    
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }
    
    public void setMajor(String major) {
        this.major = major;
    }
    
    public void setGpa(double gpa) {
        this.gpa = gpa;
    }
    
    // 其他方法
    public void displayInfo() {
        System.out.println("学生信息:");
        System.out.println("姓名: " + name);
        System.out.println("年龄: " + age);
        System.out.println("学号: " + studentId);
        System.out.println("专业: " + major);
        System.out.println("GPA: " + gpa);
    }
    
    public boolean isHonorStudent() {
        return gpa >= 3.5;
    }
    
    public void study(int hours) {
        System.out.println(name + " 学习了 " + hours + " 小时。");
        // 模拟学习后GPA可能提高
        if (hours > 2 && gpa < 4.0) {
            gpa += 0.1;
            if (gpa > 4.0) gpa = 4.0;
            System.out.println("学习后，GPA 提升到: " + gpa);
        }
    }
    
    // toString方法
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
}