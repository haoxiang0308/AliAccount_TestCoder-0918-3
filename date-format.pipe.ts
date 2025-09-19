import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'dateFormat'
})
export class DateFormatPipe implements PipeTransform {

  transform(value: any, format: string = 'yyyy-MM-dd'): any {
    if (!value) return '';

    // Convert value to Date object if it's not already
    const date = value instanceof Date ? value : new Date(value);

    // Check if date is valid
    if (isNaN(date.getTime())) {
      return '';
    }

    // Format the date based on the format string
    switch (format) {
      case 'yyyy-MM-dd':
        return date.getFullYear() + '-' + 
               this.padZero(date.getMonth() + 1) + '-' + 
               this.padZero(date.getDate());
      
      case 'dd/MM/yyyy':
        return this.padZero(date.getDate()) + '/' + 
               this.padZero(date.getMonth() + 1) + '/' + 
               date.getFullYear();
      
      case 'MM/dd/yyyy':
        return this.padZero(date.getMonth() + 1) + '/' + 
               this.padZero(date.getDate()) + '/' + 
               date.getFullYear();
      
      case 'full':
        return date.toLocaleDateString() + ' ' + 
               date.toLocaleTimeString();
      
      default:
        return date.toLocaleDateString();
    }
  }

  private padZero(num: number): string {
    return num < 10 ? '0' + num : num.toString();
  }
}