public class Student {
    // 私有属性
    private String name;
    private int age;
    private String studentId;

    // 构造方法
    public Student(String name, int age, String studentId) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
    }

    // getter和setter方法
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
        if (age > 0) {
            this.age = age;
        }
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    // displayInfo方法
    public void displayInfo() {
        System.out.println("Name: " + name + ", Age: " + age + ", Student ID: " + studentId);
    }

    // 主方法，用于测试
    public static void main(String[] args) {
        Student student = new Student("Alice", 20, "S123456");
        student.displayInfo();
    }
}