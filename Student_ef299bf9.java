public class Student {
    // 私有成员变量
    private String name;
    private int age;
    private String studentId;
    private double gpa;
    
    // 构造函数
    public Student() {
        this.name = "";
        this.age = 0;
        this.studentId = "";
        this.gpa = 0.0;
    }
    
    public Student(String name, int age, String studentId, double gpa) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.gpa = gpa;
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
    
    // Setter方法
    public void setName(String name) {
        this.name = name;
    }
    
    public void setAge(int age) {
        if (age > 0) { // 年龄必须大于0
            this.age = age;
        }
    }
    
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }
    
    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) { // GPA在0.0到4.0之间
            this.gpa = gpa;
        }
    }
    
    // 显示学生信息的方法
    public void displayInfo() {
        System.out.println("学生信息:");
        System.out.println("姓名: " + name);
        System.out.println("年龄: " + age);
        System.out.println("学号: " + studentId);
        System.out.println("GPA: " + gpa);
    }
    
    // 判断学生是否优秀 (GPA >= 3.5)
    public boolean isExcellent() {
        return gpa >= 3.5;
    }
    
    // 计算成绩等级
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
    
    // 重写toString方法
    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", gpa=" + gpa +
                '}';
    }
    
    // 主方法，用于测试
    public static void main(String[] args) {
        // 创建学生对象
        Student student1 = new Student("张三", 20, "2021001", 3.8);
        Student student2 = new Student();
        
        // 显示学生信息
        student1.displayInfo();
        System.out.println("成绩等级: " + student1.getGradeLevel());
        System.out.println("是否优秀: " + student1.isExcellent());
        
        System.out.println("\n" + student1.toString());
        
        // 使用setter方法设置第二个学生的信息
        student2.setName("李四");
        student2.setAge(19);
        student2.setStudentId("2021002");
        student2.setGpa(3.2);
        
        System.out.println("\n第二个学生信息:");
        System.out.println(student2.toString());
        System.out.println("成绩等级: " + student2.getGradeLevel());
        System.out.println("是否优秀: " + student2.isExcellent());
    }
}