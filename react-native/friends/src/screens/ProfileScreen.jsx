import React, { PureComponent } from 'react';
import { View, Text, Image } from 'react-native';

class ProfileScreen extends PureComponent {
  render() {
    const { params: friend } = this.props.navigation.state;

    return (
      <View>
        <Image
          style={{
            width: 150,
            height: 150,
          }}
          source={{
            uri: friend.picture.large,
          }}
        />
        <Text>{friend.name.first}</Text>
        <Text>{friend.name.last}</Text>
        <Text>{friend.login.username}</Text>
        <Text>{friend.email}</Text>
        <Text>{friend.dob.age}</Text>
        <Text>{friend.cell}</Text>
      </View>
    );
  }
}

export default ProfileScreen;
