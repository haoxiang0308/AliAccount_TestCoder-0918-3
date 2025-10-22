import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'dateFormat'
})
export class DateFormatPipe implements PipeTransform {

  transform(value: Date | string | null | undefined, format: string = 'yyyy-MM-dd'): string {
    if (!value) {
      return '';
    }

    // 如果输入是字符串，则转换为Date对象
    const date = typeof value === 'string' ? new Date(value) : value;

    // 验证日期是否有效
    if (isNaN(date.getTime())) {
      return 'Invalid Date';
    }

    // 根据格式化字符串格式化日期
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    const hours = String(date.getHours()).padStart(2, '0');
    const minutes = String(date.getMinutes()).padStart(2, '0');
    const seconds = String(date.getSeconds()).padStart(2, '0');

    // 简单的格式映射
    let formatted = format;
    formatted = formatted.replace('yyyy', String(year));
    formatted = formatted.replace('MM', month);
    formatted = formatted.replace('dd', day);
    formatted = formatted.replace('HH', hours);
    formatted = formatted.replace('mm', minutes);
    formatted = formatted.replace('ss', seconds);

    return formatted;
  }
}