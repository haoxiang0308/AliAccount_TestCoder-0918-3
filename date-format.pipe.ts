import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'dateFormat'
})
export class DateFormatPipe implements PipeTransform {

  transform(value: Date | string | number, format: string = 'yyyy-MM-dd'): string {
    if (!value) {
      return '';
    }

    let date: Date;

    // 处理不同类型的输入
    if (value instanceof Date) {
      date = value;
    } else if (typeof value === 'string') {
      date = new Date(value);
    } else if (typeof value === 'number') {
      // 假设是时间戳
      date = new Date(value);
    } else {
      return '';
    }

    // 检查日期是否有效
    if (isNaN(date.getTime())) {
      return '';
    }

    // 解析格式字符串
    const year = date.getFullYear();
    const month = date.getMonth() + 1;
    const day = date.getDate();
    const hours = date.getHours();
    const minutes = date.getMinutes();
    const seconds = date.getSeconds();

    // 根据格式字符串格式化日期
    let formatted = format;
    formatted = formatted.replace(/yyyy/g, year.toString());
    formatted = formatted.replace(/MM/g, month.toString().padStart(2, '0'));
    formatted = formatted.replace(/dd/g, day.toString().padStart(2, '0'));
    formatted = formatted.replace(/HH/g, hours.toString().padStart(2, '0'));
    formatted = formatted.replace(/mm/g, minutes.toString().padStart(2, '0'));
    formatted = formatted.replace(/ss/g, seconds.toString().padStart(2, '0'));

    return formatted;
  }
}