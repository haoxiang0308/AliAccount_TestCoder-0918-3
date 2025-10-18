import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'dateFormat'
})
export class DateFormatPipe implements PipeTransform {
  transform(value: any, format: string = 'YYYY-MM-DD'): string {
    if (!value) {
      return '';
    }

    // 创建日期对象
    const date = new Date(value);
    
    // 检查日期是否有效
    if (isNaN(date.getTime())) {
      return 'Invalid Date';
    }

    // 获取日期组件
    const year = date.getFullYear();
    const month = date.getMonth() + 1; // 月份从0开始，需要+1
    const day = date.getDate();
    const hours = date.getHours();
    const minutes = date.getMinutes();
    const seconds = date.getSeconds();

    // 根据格式字符串替换标记
    let formattedDate = format;
    formattedDate = formattedDate.replace('YYYY', year.toString());
    formattedDate = formattedDate.replace('MM', month.toString().padStart(2, '0'));
    formattedDate = formattedDate.replace('DD', day.toString().padStart(2, '0'));
    formattedDate = formattedDate.replace('HH', hours.toString().padStart(2, '0'));
    formattedDate = formattedDate.replace('mm', minutes.toString().padStart(2, '0'));
    formattedDate = formattedDate.replace('ss', seconds.toString().padStart(2, '0'));

    return formattedDate;
  }
}