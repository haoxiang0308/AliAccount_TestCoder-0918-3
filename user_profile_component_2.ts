import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  role: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-card">
      <h2>User Profile</h2>
      <div *ngIf="profile; else noProfile">
        <p><strong>ID:</strong> {{ profile.id }}</p>
        <p><strong>Name:</strong> {{ profile.name }}</p>
        <p><strong>Email:</strong> {{ profile.email }}</p>
        <p><strong>Role:</strong> {{ profile.role }}</p>
      </div>
      <ng-template #noProfile>
        <p>No profile data available.</p>
      </ng-template>
    </div>
  `,
  styles: [`
    .profile-card {
      border: 1px solid #ccc;
      padding: 16px;
      max-width: 400px;
      margin: 10px;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
  `]
})
export class UserProfileComponent {
  @Input() profile?: UserProfile;
}