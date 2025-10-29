public class Student {
    // 学生属性
    private String studentId;
    private String name;
    private int age;
    private String major;
    private double gpa;
    
    // 构造函数
    public Student(String studentId, String name, int age, String major, double gpa) {
        this.studentId = studentId;
        this.name = name;
        this.age = age;
        this.major = major;
        this.gpa = gpa;
    }
    
    // 获取学生ID
    public String getStudentId() {
        return studentId;
    }
    
    // 设置学生ID
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }
    
    // 获取姓名
    public String getName() {
        return name;
    }
    
    // 设置姓名
    public void setName(String name) {
        this.name = name;
    }
    
    // 获取年龄
    public int getAge() {
        return age;
    }
    
    // 设置年龄
    public void setAge(int age) {
        this.age = age;
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
        System.out.println("学生ID: " + studentId);
        System.out.println("姓名: " + name);
        System.out.println("年龄: " + age);
        System.out.println("专业: " + major);
        System.out.println("GPA: " + gpa);
    }
    
    // 判断学生是否为优秀学生 (GPA >= 3.5)
    public boolean isExcellentStudent() {
        return gpa >= 3.5;
    }
    
    // 判断学生是否及格 (GPA >= 2.0)
    public boolean isPassing() {
        return gpa >= 2.0;
    }
    
    // 获取学生等级
    public String getGradeLevel() {
        if (gpa >= 3.7) {
            return "A+";
        } else if (gpa >= 3.3) {
            return "A";
        } else if (gpa >= 3.0) {
            return "B+";
        } else if (gpa >= 2.7) {
            return "B";
        } else if (gpa >= 2.3) {
            return "C+";
        } else if (gpa >= 2.0) {
            return "C";
        } else {
            return "F";
        }
    }
    
    // 重写toString方法
    @Override
    public String toString() {
        return "Student{" +
                "studentId='" + studentId + '\'' +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", major='" + major + '\'' +
                ", gpa=" + gpa +
                '}';
    }
    
    // 重写equals方法
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Student student = (Student) obj;
        return studentId.equals(student.studentId);
    }
    
    // 重写hashCode方法
    @Override
    public int hashCode() {
        return studentId.hashCode();
    }
    
    // 主方法，用于测试
    public static void main(String[] args) {
        // 创建学生对象
        Student student1 = new Student("S001", "张三", 20, "计算机科学", 3.8);
        Student student2 = new Student("S002", "李四", 19, "数学", 2.5);
        
        // 显示学生信息
        System.out.println("=== 学生1信息 ===");
        student1.displayInfo();
        System.out.println("等级: " + student1.getGradeLevel());
        System.out.println("是否为优秀学生: " + student1.isExcellentStudent());
        System.out.println("是否及格: " + student1.isPassing());
        
        System.out.println("\n=== 学生2信息 ===");
        student2.displayInfo();
        System.out.println("等级: " + student2.getGradeLevel());
        System.out.println("是否为优秀学生: " + student2.isExcellentStudent());
        System.out.println("是否及格: " + student2.isPassing());
        
        // 测试toString方法
        System.out.println("\n=== 使用toString方法 ===");
        System.out.println(student1.toString());
        System.out.println(student2.toString());
    }
}