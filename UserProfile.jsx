import React from 'react';

const UserProfile = ({ user }) => {
  const { firstName, lastName, email, phone, address, bio, avatar } = user;

  return (
    <div className="user-profile">
      <div className="profile-header">
        {avatar && (
          <img 
            src={avatar} 
            alt={`Avatar of ${firstName} ${lastName}`}
            className="avatar"
          />
        )}
        <div className="user-info">
          <h1>{firstName} {lastName}</h1>
          <p className="email">{email}</p>
          {phone && <p className="phone">{phone}</p>}
        </div>
      </div>
      
      <div className="profile-details">
        {address && (
          <div className="detail-item">
            <strong>Address:</strong>
            <span>{address}</span>
          </div>
        )}
        
        {bio && (
          <div className="detail-item">
            <strong>Bio:</strong>
            <p>{bio}</p>
          </div>
        )}
      </div>
    </div>
  );
};

export default UserProfile;