import { Pipe, PipeTransform } from '@angular/core';

/**
 * A pipe to format dates using the native JavaScript `Date.prototype.toLocaleDateString` method.
 * It accepts optional locale and options parameters for formatting.
 */
@Pipe({
  name: 'customDate'
})
export class CustomDatePipe implements PipeTransform {
  /**
   * Transforms a date value into a formatted string.
   * @param value The input date. Can be a Date object, a string representing a date, or a number (timestamp).
   * @param locale The locale to use for formatting (e.g., 'en-US', 'zh-CN'). Defaults to 'en-US'.
   * @param options Optional formatting options (e.g., { year: 'numeric', month: 'long', day: 'numeric' }).
   * @returns A string representation of the formatted date, or the original value if it's invalid.
   */
  transform(
    value: Date | string | number | null | undefined,
    locale: string = 'en-US',
    options?: Intl.DateTimeFormatOptions
  ): string {
    if (value === null || value === undefined || value === '') {
      return '';
    }

    // Create a new Date object from the input value.
    // This handles Date objects, ISO strings, and timestamps.
    const date = new Date(value);

    // Check if the date is valid.
    if (isNaN(date.getTime())) {
      console.error(`CustomDatePipe: Invalid date value: ${value}`);
      return `${value}`; // Return the original value as a string if it's invalid
    }

    // Use the provided locale and options, or default to a common format.
    const resolvedOptions = options || { year: 'numeric', month: 'short', day: 'numeric' };
    return date.toLocaleDateString(locale, resolvedOptions);
  }
}