public class RandomStudentClass {
    // 私有成员变量
    private String name;
    private int age;
    private String studentId;
    private double gpa;
    
    // 构造函数
    public RandomStudentClass() {
        this.name = "";
        this.age = 0;
        this.studentId = "";
        this.gpa = 0.0;
    }
    
    public RandomStudentClass(String name, int age, String studentId, double gpa) {
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
        if (age > 0) { // 确保年龄为正数
            this.age = age;
        }
    }
    
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }
    
    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) { // 确保GPA在合理范围内
            this.gpa = gpa;
        }
    }
    
    // 其他方法
    public void displayInfo() {
        System.out.println("学生信息:");
        System.out.println("姓名: " + name);
        System.out.println("年龄: " + age);
        System.out.println("学号: " + studentId);
        System.out.println("GPA: " + gpa);
    }
    
    public boolean isExcellent() {
        return gpa >= 3.5; // GPA大于等于3.5为优秀学生
    }
    
    public int getGraduationYear(int currentYear) {
        // 假设学生在18岁时入学，学制为4年
        int admissionAge = 18;
        int admissionYear = currentYear - this.age + admissionAge;
        return admissionYear + 4;
    }
    
    @Override
    public String toString() {
        return "RandomStudentClass{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", gpa=" + gpa +
                '}';
    }
    
    public static void main(String[] args) {
        // 测试RandomStudentClass类
        RandomStudentClass student1 = new RandomStudentClass("张三", 20, "2021001", 3.7);
        RandomStudentClass student2 = new RandomStudentClass();
        
        student2.setName("李四");
        student2.setAge(19);
        student2.setStudentId("2021002");
        student2.setGpa(3.2);
        
        System.out.println("=== 学生1信息 ===");
        student1.displayInfo();
        System.out.println("是否优秀: " + student1.isExcellent());
        System.out.println("预计毕业年份: " + student1.getGraduationYear(2023));
        System.out.println(student1.toString());
        
        System.out.println("\n=== 学生2信息 ===");
        student2.displayInfo();
        System.out.println("是否优秀: " + student2.isExcellent());
        System.out.println("预计毕业年份: " + student2.getGraduationYear(2023));
        System.out.println(student2.toString());
    }
}