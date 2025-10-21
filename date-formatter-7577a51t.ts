import { Pipe, PipeTransform } from '@angular/core';
import { formatDate } from '@angular/common';

@Pipe({
  name: 'dateFormatter'
})
export class DateFormatterPipe implements PipeTransform {
  transform(value: any, format: string = 'mediumDate', locale: string = 'en-US'): any {
    if (!value) {
      return null;
    }

    // Handle different input types (string, Date, number)
    let dateValue: Date | null = null;

    if (value instanceof Date) {
      dateValue = value;
    } else if (typeof value === 'string' || typeof value === 'number') {
      dateValue = new Date(value);
    }

    if (!dateValue || isNaN(dateValue.getTime())) {
      console.warn('Invalid date passed to dateFormatter pipe:', value);
      return null;
    }

    // Use Angular's formatDate function to format the date
    return formatDate(dateValue, format, locale);
  }
}