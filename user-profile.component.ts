import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  bio?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-card">
      <h2>User Profile</h2>
      <p><strong>ID:</strong> {{ user.id }}</p>
      <p><strong>Name:</strong> {{ user.name }}</p>
      <p><strong>Email:</strong> {{ user.email }}</p>
      <p *ngIf="user.bio"><strong>Bio:</strong> {{ user.bio }}</p>
    </div>
  `,
  styles: [`
    .profile-card {
      border: 1px solid #ccc;
      padding: 16px;
      margin: 8px;
      max-width: 400px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: UserProfile;
 // Example usage within the component itself for demonstration if needed
  // exampleUser: UserProfile = {
  //   id: 1,
  //   name: 'John Doe',
  //   email: 'john.doe@example.com',
  //   bio: 'Software Developer'
  // };
}