import { Pipe, PipeTransform } from '@angular/core';

/**
 * 自定义管道，用于格式化日期。
 * 使用示例: {{ someDate | dateFormat:'yyyy-MM-dd' }}
 */
@Pipe({
  name: 'dateFormat'
})
export class DateFormatPipe implements PipeTransform {

  /**
   * 转换日期对象或日期字符串为指定格式的字符串。
   * @param value 输入的日期值，可以是 Date 对象或可转换为日期的字符串/数字。
   * @param format 期望的输出格式，例如 'yyyy-MM-dd' 或 'MM/dd/yyyy'。
   * @returns 格式化后的日期字符串，如果输入无效则返回 'Invalid Date'。
   */
  transform(value: any, format: string = 'yyyy-MM-dd'): string {
    // 尝试将输入值转换为 Date 对象
    const date = new Date(value);

    // 检查日期是否有效
    if (isNaN(date.getTime())) {
      return 'Invalid Date';
    }

    // 定义年、月、日
    const year = date.getFullYear();
    const month = date.getMonth() + 1; // getMonth() 返回 0-11，需要加1
    const day = date.getDate();
    const hours = date.getHours();
    const minutes = date.getMinutes();
    const seconds = date.getSeconds();

    // 根据格式字符串进行替换
    // 这是一个简化的实现，只处理 'yyyy', 'MM', 'dd', 'HH', 'mm', 'ss'
    let formattedString = format;
    formattedString = formattedString.replace('yyyy', year.toString());
    formattedString = formattedString.replace('MM', month.toString().padStart(2, '0'));
    formattedString = formattedString.replace('dd', day.toString().padStart(2, '0'));
    formattedString = formattedString.replace('HH', hours.toString().padStart(2, '0'));
    formattedString = formattedString.replace('mm', minutes.toString().padStart(2, '0'));
    formattedString = formattedString.replace('ss', seconds.toString().padStart(2, '0'));

    return formattedString;
  }
}