import { Component, Input } from '@angular/core';

interface User {
  id: number;
  name: string;
  email: string;
  role: string;
  avatar: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-card" *ngIf="user">
      <img [src]="user.avatar" [alt]="'Avatar for ' + user.name" class="avatar">
      <h2>{{ user.name }}</h2>
      <p><strong>Email:</strong> {{ user.email }}</p>
      <p><strong>Role:</strong> {{ user.role }}</p>
    </div>
    <p *ngIf="!user">No user data available.</p>
  `,
  styles: [`
    .profile-card {
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 16px;
      max-width: 300px;
      text-align: center;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
    }
  `]
})
export class UserProfile12345Component {
  @Input() user: User | undefined;
 // Example user data
  // user: User = {
  //   id: 1,
  //   name: 'John Doe',
  //   email: 'john.doe@example.com',
  //   role: 'Admin',
  //   avatar: 'https://example.com/avatar.jpg'
  // };
}
