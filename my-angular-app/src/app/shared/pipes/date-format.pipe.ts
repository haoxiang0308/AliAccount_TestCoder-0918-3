import { Pipe, PipeTransform } from '@angular/core';

/**
 * A pipe to format a date using the Intl.DateTimeFormat API.
 * Usage: value | dateFormat:'en-US':'long'
 */
@Pipe({
  name: 'dateFormat',
  standalone: true
})
export class DateFormatPipe implements PipeTransform {
  transform(value: Date | string | number, locale: string = 'en-US', options: Intl.DateTimeFormatOptions = {}): string {
    // Handle null, undefined, or empty string
    if (!value) {
      return '';
    }

    // Create a Date object from the input value
    const date = new Date(value);

    // Check if the date is valid
    if (isNaN(date.getTime())) {
      console.error('Invalid date passed to DateFormatPipe:', value);
      return '';
    }

    try {
      // Use Intl.DateTimeFormat for robust formatting
      const formatter = new Intl.DateTimeFormat(locale, options);
      return formatter.format(date);
    } catch (error) {
      console.error('Error formatting date in DateFormatPipe:', error);
      return '';
    }
  }
}
