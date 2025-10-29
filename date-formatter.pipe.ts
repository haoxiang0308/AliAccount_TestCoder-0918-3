import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'dateFormatter'
})
export class DateFormatterPipe implements PipeTransform {
  transform(value: any, format: string = 'YYYY-MM-DD'): string {
    if (!value) {
      return '';
    }

    const date = new Date(value);
    
    if (isNaN(date.getTime())) {
      return 'Invalid Date';
    }

    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    const hours = String(date.getHours()).padStart(2, '0');
    const minutes = String(date.getMinutes()).padStart(2, '0');
    const seconds = String(date.getSeconds()).padStart(2, '0');

    switch (format) {
      case 'MM/DD/YYYY':
        return `${month}/${day}/${year}`;
      case 'DD/MM/YYYY':
        return `${day}/${month}/${year}`;
      case 'YYYY-MM-DD HH:mm':
        return `${year}-${month}-${day} ${hours}:${minutes}`;
      case 'DD-MM-YYYY':
        return `${day}-${month}-${year}`;
      case 'MM-DD-YYYY':
        return `${month}-${day}-${year}`;
      case 'full':
        return `${year}年${month}月${day}日 ${hours}:${minutes}:${seconds}`;
      case 'short':
        return `${month}/${day}/${year}`;
      default:
        return `${year}-${month}-${day}`;
    }
  }
}