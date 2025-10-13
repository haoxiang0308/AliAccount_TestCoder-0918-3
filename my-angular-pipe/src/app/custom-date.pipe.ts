import { Pipe, PipeTransform } from '@angular/core';

/**
 * A pipe to format a date using the standard `Date.prototype.toLocaleDateString` method.
 * It accepts an optional locale string.
 */
@Pipe({
  name: 'customDate'
})
export class CustomDatePipe implements PipeTransform {

  /**
   * Transforms a date value into a localized string.
   * @param value The input date. Can be a Date object, a timestamp number, or an ISO string.
   * @param locale The locale to use for formatting (e.g., 'en-US', 'zh-CN'). Defaults to 'en-US'.
   * @returns A string representation of the date formatted according to the locale.
   */
  transform(value: Date | string | number, locale: string = 'en-US'): string {
    if (value === null || value === undefined) {
      return '';
    }

    const date = new Date(value);
    if (isNaN(date.getTime())) {
      console.error('Invalid date passed to CustomDatePipe:', value);
      return 'Invalid Date';
    }

    return date.toLocaleDateString(locale);
  }
}