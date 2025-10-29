// Sample usage of the UserProfileComponent

import { Component } from '@angular/core';
import { UserProfile } from './user-profile.component';

@Component({
  selector: 'app-sample',
  template: `
    <h1>User Profiles</h1>
    
    <!-- Profile with all information -->
    <app-user-profile [user]="user1"></app-user-profile>
    
    <!-- Profile with minimal information -->
    <app-user-profile [user]="user2"></app-user-profile>
  `
})
export class SampleComponent {
  user1: UserProfile = {
    id: 1,
    name: 'John Doe',
    email: 'john.doe@example.com',
    avatar: 'https://via.placeholder.com/80',
    bio: 'Software developer passionate about Angular and web technologies.',
    joinDate: new Date('2022-01-15'),
    location: 'San Francisco, CA'
  };

  user2: UserProfile = {
    id: 2,
    name: 'Jane Smith',
    email: 'jane.smith@example.com',
    bio: 'Designer and UI/UX enthusiast.',
    joinDate: new Date('2021-11-30')
  };
}