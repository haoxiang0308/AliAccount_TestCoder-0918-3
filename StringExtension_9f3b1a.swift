// Swift 扩展，为 String 类型添加反转方法

extension String {
    /// 返回当前字符串反转后的新字符串。
    /// 例如: "hello".reversedString() -> "olleh"
    func reversedString() -> String {
        return String(self.reversed())
    }
}

// 示例用法
let originalString = "Hello, World!"
let reversedString = originalString.reversedString()

print("Original: $originalString)")
print("Reversed: $reversedString)")