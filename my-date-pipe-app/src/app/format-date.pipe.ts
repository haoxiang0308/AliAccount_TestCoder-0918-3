import { Pipe, PipeTransform } from '@angular/core';

/**
 * A pipe to format a date string or Date object into a more readable format.
 * Example usage: {{ dateValue | formatDate:'medium' }}
 * Format options: 'short', 'medium', 'long', 'full', or custom format like 'yyyy-MM-dd'.
 */
@Pipe({
  name: 'formatDate',
  standalone: true
})
export class FormatDatePipe implements PipeTransform {
  transform(value: string | Date | null, format: string = 'medium'): string {
    if (value === null || value === undefined) {
      return '';
    }

    const date = new Date(value);
    if (isNaN(date.getTime())) {
      console.error('Invalid date passed to FormatDatePipe:', value);
      return 'Invalid Date';
    }

    // Simple format mapping for demonstration.
    // A real implementation might use Intl.DateTimeFormat with more options.
    switch (format) {
      case 'short':
        return date.toLocaleDateString();
      case 'medium':
        return date.toLocaleString();
      case 'long':
        return date.toLocaleString('en-US', { dateStyle: 'long', timeStyle: 'long' });
      case 'full':
        return date.toLocaleString('en-US', { dateStyle: 'full', timeStyle: 'long' });
      default:
        // For custom formats, a more complex parser would be needed.
        // This is a basic fallback using the default locale string.
        console.warn('Custom date formats not fully implemented in this example. Using default format.');
        return date.toString();
    }
  }
}