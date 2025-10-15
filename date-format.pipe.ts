import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'dateFormat'
})
export class DateFormatPipe implements PipeTransform {

  transform(value: Date | string | number, format: string = 'YYYY-MM-DD'): string {
    if (!value) {
      return '';
    }

    let date: Date;

    // 根据输入类型转换为Date对象
    if (typeof value === 'string') {
      date = new Date(value);
    } else if (typeof value === 'number') {
      // 假设是时间戳
      date = new Date(value);
    } else {
      date = value;
    }

    // 检查日期是否有效
    if (isNaN(date.getTime())) {
      return '';
    }

    // 定义格式化映射
    const year = date.getFullYear();
    const month = date.getMonth() + 1;
    const day = date.getDate();
    const hours = date.getHours();
    const minutes = date.getMinutes();
    const seconds = date.getSeconds();

    // 替换格式字符串中的占位符
    let formatted = format
      .replace(/YYYY/g, year.toString())
      .replace(/MM/g, month.toString().padStart(2, '0'))
      .replace(/DD/g, day.toString().padStart(2, '0'))
      .replace(/HH/g, hours.toString().padStart(2, '0'))
      .replace(/mm/g, minutes.toString().padStart(2, '0'))
      .replace(/ss/g, seconds.toString().padStart(2, '0'));

    return formatted;
  }
}