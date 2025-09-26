import { Component, Input } from '@angular/core';

export interface User {
  id: number;
  name: string;
  email: string;
  role: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container">
      <h2>User Profile</h2>
      <div class="profile-card">
        <p><strong>ID:</strong> {{ user.id }}</p>
        <p><strong>Name:</strong> {{ user.name }}</p>
        <p><strong>Email:</strong> {{ user.email }}</p>
        <p><strong>Role:</strong> {{ user.role }}</p>
      </div>
    </div>
  `,
  styles: [`
    .profile-container {
      padding: 20px;
      font-family: Arial, sans-serif;
    }
    .profile-card {
      border: 1px solid #ccc;
      padding: 15px;
      border-radius: 4px;
      background-color: #f9f9f9;
    }
    h2 {
      color: #333;
    }
    p {
      margin: 8px 0;
    }
    strong {
      color: #555;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: User;
 // Optional: Initialize with a default user if no input is provided
  // ngOnInit() {
  //   if (!this.user) {
  //     this.user = { id: 0, name: 'Default User', email: 'default@example.com', role: 'User' };
  //   }
  // }
}