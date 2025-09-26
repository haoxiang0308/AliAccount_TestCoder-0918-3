import { Pipe, PipeTransform } from '@angular/core';

/**
 * 自定义管道，用于格式化日期。
 * 使用示例: {{ someDate | customDateFormat }}
 */
@Pipe({
  name: 'customDateFormat'
})
export class CustomDateFormatPipe implements PipeTransform {

  /**
   * 转换日期对象或日期字符串为 'YYYY年MM月DD日' 格式。
   * @param value 输入的日期值，可以是 Date 对象或可转换为日期的字符串。
   * @returns 格式化后的日期字符串，如果输入无效则返回 '无效日期'。
   */
  transform(value: Date | string | null | undefined): string {
    if (value === null || value === undefined) {
      return '输入值为空';
    }

    const date = new Date(value);
    if (isNaN(date.getTime())) {
      // 检查日期是否有效
      return '无效日期';
    }

    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0'); // 月份从0开始，需要+1
    const day = String(date.getDate()).padStart(2, '0');

    return `${year}年${month}月${day}日`;
  }
}
