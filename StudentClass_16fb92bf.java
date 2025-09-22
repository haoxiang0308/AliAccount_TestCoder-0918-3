public class StudentClass_16fb92bf {
    // 学生属性
    private String name;
    private int age;
    private String studentId;
    private double gpa;
    
    // 构造函数
    public StudentClass_16fb92bf() {
        this.name = "";
        this.age = 0;
        this.studentId = "";
        this.gpa = 0.0;
    }
    
    // 带参数的构造函数
    public StudentClass_16fb92bf(String name, int age, String studentId, double gpa) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
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
        if (age > 0) {
            this.age = age;
        }
    }
    
    // 获取学生ID
    public String getStudentId() {
        return studentId;
    }
    
    // 设置学生ID
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }
    
    // 获取学生GPA
    public double getGpa() {
        return gpa;
    }
    
    // 设置学生GPA
    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) {
            this.gpa = gpa;
        }
    }
    
    // 显示学生信息
    public void displayInfo() {
        System.out.println("学生姓名: " + name);
        System.out.println("学生年龄: " + age);
        System.out.println("学生ID: " + studentId);
        System.out.println("学生GPA: " + gpa);
    }
    
    // 判断学生是否优秀 (GPA >= 3.5)
    public boolean isExcellent() {
        return gpa >= 3.5;
    }
    
    // 主方法，用于测试
    public static void main(String[] args) {
        // 创建学生对象
        StudentClass_16fb92bf student1 = new StudentClass_16fb92bf("张三", 20, "S001", 3.8);
        StudentClass_16fb92bf student2 = new StudentClass_16fb92bf("李四", 19, "S002", 3.2);
        
        // 显示学生信息
        System.out.println("学生1信息:");
        student1.displayInfo();
        System.out.println("是否优秀: " + student1.isExcellent());
        
        System.out.println("\n学生2信息:");
        student2.displayInfo();
        System.out.println("是否优秀: " + student2.isExcellent());
        
        // 修改学生信息
        student2.setGpa(3.6);
        System.out.println("\n修改后的学生2信息:");
        student2.displayInfo();
        System.out.println("是否优秀: " + student2.isExcellent());
    }
}