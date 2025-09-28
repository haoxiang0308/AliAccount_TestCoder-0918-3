import random
import string
from xml.etree.ElementTree import Element, SubElement, tostring

# Создаем корневой элемент XML
root = Element("student")

# Добавляем информацию о студенте
name = SubElement(root, "name")
name.text = "Иванов Иван Иванович"

age = SubElement(root, "age")
age.text = "20"

student_id = SubElement(root, "student_id")
student_id.text = "S12345678"

course = SubElement(root, "course")
course.text = "3"

specialty = SubElement(root, "specialty")
specialty.text = "Информатика и вычислительная техника"

# Генерируем случайное имя файла
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + ".xml"

# Сохраняем XML в файл
with open(random_filename, 'wb') as f:
    f.write(tostring(root, encoding='utf-8'))

print(f"XML-документ сохранен в файл: {random_filename}")