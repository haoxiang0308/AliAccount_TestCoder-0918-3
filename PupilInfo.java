public class PupilInfo {
    // 学生属性
    private String name;
    private int age;
    private String studentId;
    private String major;
    private double gpa;

    // 构造函数
    public PupilInfo(String name, int age, String studentId, String major, double gpa) {
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

    // 判断学生是否为优秀学生（GPA >= 3.5）
    public boolean isExcellentStudent() {
        return gpa >= 3.5;
    }

    // 根据GPA判断等级
    public String getGradeLevel() {
        if (gpa >= 4.0) {
            return "A+";
        } else if (gpa >= 3.7) {
            return "A";
        } else if (gpa >= 3.3) {
            return "A-";
        } else if (gpa >= 3.0) {
            return "B+";
        } else if (gpa >= 2.7) {
            return "B";
        } else if (gpa >= 2.3) {
            return "B-";
        } else if (gpa >= 2.0) {
            return "C+";
        } else if (gpa >= 1.7) {
            return "C";
        } else if (gpa >= 1.3) {
            return "C-";
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
                ", major='" + major + '\'' +
                ", gpa=" + gpa +
                '}';
    }

    // 主方法用于测试
    public static void main(String[] args) {
        // 创建一个学生对象
        PupilInfo student = new PupilInfo("张三", 20, "2021001", "计算机科学", 3.8);
        
        // 显示学生信息
        student.displayInfo();
        
        // 显示学生等级
        System.out.println("学生等级: " + student.getGradeLevel());
        
        // 检查是否为优秀学生
        System.out.println("是否为优秀学生: " + student.isExcellentStudent());
        
        // 测试toString方法
        System.out.println(student.toString());
    }
}