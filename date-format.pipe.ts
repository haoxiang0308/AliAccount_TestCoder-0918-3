import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'dateFormat'
})
export class DateFormatPipe implements PipeTransform {

  transform(value: any, format?: string): string {
    if (!value) return '';
    
    const date = new Date(value);
    
    if (isNaN(date.getTime())) {
      return 'Invalid Date';
    }
    
    // Default format: YYYY-MM-DD
    if (!format) {
      const year = date.getFullYear();
      const month = String(date.getMonth() + 1).padStart(2, '0');
      const day = String(date.getDate()).padStart(2, '0');
      return `${year}-${month}-${day}`;
    }
    
    // Custom format implementation
    const formats: { [key: string]: string } = {
      'short': date.toLocaleDateString(),
      'long': date.toLocaleDateString(undefined, { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' }),
      'iso': date.toISOString(),
      'time': date.toLocaleTimeString(),
      'datetime': `${date.toLocaleDateString()} ${date.toLocaleTimeString()}`
    };
    
    return formats[format] || this.defaultFormat(date);
  }
  
  private defaultFormat(date: Date): string {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
  }
}