# Date Format Pipe for Angular

This package contains a customizable date formatting pipe for Angular applications.

## Installation

1. Copy the `date-format.pipe.ts` file to your Angular project's pipes directory.

2. Import and declare the pipe in your Angular module:

```typescript
import { NgModule } from '@angular/core';
import { DateFormatPipe } from './pipes/date-format.pipe';

@NgModule({
  declarations: [
    DateFormatPipe,
    // ... other components and pipes
  ],
  // ... other module configuration
})
export class YourModule { }
```

## Usage

After importing the pipe, you can use it in your templates:

```html
<!-- Default format (yyyy-MM-dd) -->
<p>{{ dateValue | dateFormat }}</p>

<!-- Specific formats -->
<p>{{ dateValue | dateFormat:'dd/MM/yyyy' }}</p>
<p>{{ dateValue | dateFormat:'MM/dd/yyyy' }}</p>
<p>{{ dateValue | dateFormat:'full' }}</p>
```

## Supported Formats

- `yyyy-MM-dd` (default): 2023-05-15
- `dd/MM/yyyy`: 15/05/2023
- `MM/dd/yyyy`: 05/15/2023
- `full`: Complete date and time based on locale

## Example

See `example-usage.ts` for a complete example of how to use the pipe in a component.