class UserProfile {
  final String? id;
  final String? fullName;
  final String? email;
  final String? displayName;
  final String? facebookProfile;
  final String? instagramProfile;
  final int level;
  final int numFollowers;
  final int numFollowings;
  final String? photoUrl;
  final String? tiktokProfile;
  final List? uploadedVideos;
  final String? youtubeProfile;
  UserProfile(
      {this.id,
      this.fullName,
      this.email,
      this.displayName,
      this.facebookProfile,
      this.instagramProfile,
      this.level = 0,
      this.numFollowers = 0,
      this.numFollowings = 0,
      this.photoUrl = '',
      this.tiktokProfile,
      this.uploadedVideos,
      this.youtubeProfile});

  UserProfile.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        displayName = data['displayName'],
        facebookProfile = data['facebookProfile'],
        instagramProfile = data['instagramProfile'],
        level = data['level'],
        numFollowers = data['numFollowers'],
        numFollowings = data['numFollowings'],
        photoUrl = data['photoUrl'],
        tiktokProfile = data['tiktokProfile'],
        uploadedVideos = data['uploadedVideos'],
        youtubeProfile = data['youtubeProfile'];
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'displayName': displayName,
      'facebookProfile': facebookProfile,
      'instagramProfile': instagramProfile,
      'level': level,
      'numFollowers': numFollowers,
      'numFollowings': numFollowings,
      'photoUrl': photoUrl,
      'tiktokProfile': tiktokProfile,
      'uploadedVideos': uploadedVideos,
      'youtubeProfile': youtubeProfile
    };
  }
}
