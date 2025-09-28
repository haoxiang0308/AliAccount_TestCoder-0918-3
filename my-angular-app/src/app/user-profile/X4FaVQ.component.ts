import { Component } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  role: string;
}

@Component({
  selector: 'app-user-profile',
  standalone: false,
  template: `
    <div class="user-profile">
      <h2>User Profile</h2>
      <div *ngIf="user">
        <p><strong>ID:</strong> {{ user.id }}</p>
        <p><strong>Name:</strong> {{ user.name }}</p>
        <p><strong>Email:</strong> {{ user.email }}</p>
        <p><strong>Role:</strong> {{ user.role }}</p>
      </div>
      <div *ngIf="!user">
        <p>Loading user profile...</p>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
      border: 1px solid #ccc;
      padding: 16px;
      margin: 16px;
      border-radius: 4px;
      max-width: 400px;
    }
  `]
})
export class UserProfileComponent {
  user: UserProfile | undefined;

  ngOnInit() {
    // Simulate fetching user data
    this.user = {
      id: 1,
      name: 'John Doe',
      email: 'john.doe@example.com',
      role: 'Admin'
    };
  }
}