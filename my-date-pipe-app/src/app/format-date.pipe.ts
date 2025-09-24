import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'formatDate'
})
export class FormatDatePipe implements PipeTransform {

  transform(value: string | Date, format: string = 'yyyy-MM-dd'): string {
    const date = new Date(value);

    if (isNaN(date.getTime())) {
      return 'Invalid Date';
    }

    const year = date.getFullYear();
    const month = date.getMonth() + 1; // getMonth() is zero-indexed
    const day = date.getDate();

    // This is a simplified example. A real pipe would support more formats.
    switch (format) {
      case 'dd/MM/yyyy':
        return `${day.toString().padStart(2, '0')}/${month.toString().padStart(2, '0')}/${year}`;
      case 'MM/dd/yyyy':
        return `${month.toString().padStart(2, '0')}/${day.toString().padStart(2, '0')}/${year}`;
      case 'longDate':
        return date.toLocaleDateString('en-US', { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' });
      default:
        return `${year}-${month.toString().padStart(2, '0')}-${day.toString().padStart(2, '0')}`;
    }
  }
}