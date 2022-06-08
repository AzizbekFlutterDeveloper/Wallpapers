
class Post {
    Post({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.promotedAt,
      this.width,
        this.height,
        this.color,
        this.blurHash,
        this.description,
        this.altDescription,
        this.urls,
        this.links,
        this.categories,
        this.likes,
        this.likedByUser,
        this.currentUserCollections,
        this.sponsorship,
        this.topicSubmissions,
        this.user,
        this.tags,
    });

    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic? promotedAt;
    int? width;
    int? height;
    String? color;
    String? blurHash;
    String? description;
    String? altDescription;
    Urls? urls;
    PostLinks? links;
    List<dynamic>? categories;
    int? likes;
    bool? likedByUser;
    List<dynamic>? currentUserCollections;
    dynamic? sponsorship;
    TopicSubmissions? topicSubmissions;
    User? user;
    List<dynamic>? tags;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        promotedAt: json["promoted_at"],
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        urls: Urls.fromJson(json["urls"]),
        links: PostLinks.fromJson(json["links"]),
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        sponsorship: json["sponsorship"],
        topicSubmissions: TopicSubmissions.fromJson(json["topic_submissions"]),
        user: User.fromJson(json["user"]),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
    );

    
}

class PostLinks {
    PostLinks({
        this.self,
        this.html,
        this.download,
        this.downloadLocation,
    });

    String? self;
    String? html;
    String? download;
    String? downloadLocation;

    factory PostLinks.fromJson(Map<String, dynamic> json) => PostLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
    };
}

class TopicSubmissions {
    TopicSubmissions();

    factory TopicSubmissions.fromJson(Map<String, dynamic> json) => TopicSubmissions(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Urls {
    Urls({
        this.raw,
        this.full,
        this.regular,
        this.small,
        this.thumb,
        this.smallS3,
    });

    String? raw;
    String? full;
    String? regular;
    String? small;
    String? thumb;
    String? smallS3;

    factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
        smallS3: json["small_s3"],
    );

    
}

class User {
    User({
        this.id,
        this.updatedAt,
        this.username,
        this.name,
        this.firstName,
        this.lastName,
        this.twitterUsername,
        this.portfolioUrl,
        this.bio,
        this.location,
        this.links,
        this.profileImage,
        this.instagramUsername,
        this.totalCollections,
        this.totalLikes,
        this.totalPhotos,
        this.acceptedTos,
        this.forHire,
        this.social,
    });

    String? id;
    DateTime? updatedAt;
    String? username;
    String? name;
    String? firstName;
    String? lastName;
    dynamic? twitterUsername;
    dynamic? portfolioUrl;
    dynamic? bio;
    dynamic? location;
    UserLinks? links;
    ProfileImage? profileImage;
    dynamic? instagramUsername;
    int? totalCollections;
    int? totalLikes;
    int? totalPhotos;
    bool? acceptedTos;
    bool? forHire;
    Social? social;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        twitterUsername: json["twitter_username"],
        portfolioUrl: json["portfolio_url"],
        bio: json["bio"],
        location: json["location"],
        links: UserLinks.fromJson(json["links"]),
        profileImage: ProfileImage.fromJson(json["profile_image"]),
        instagramUsername: json["instagram_username"],
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
        acceptedTos: json["accepted_tos"],
        forHire: json["for_hire"],
        social: Social.fromJson(json["social"]),
    );

}

class UserLinks {
    UserLinks({
        this.self,
        this.html,
        this.photos,
        this.likes,
        this.portfolio,
        this.following,
        this.followers,
    });

    String? self;
    String? html;
    String? photos;
    String? likes;
    String? portfolio;
    String? following;
    String? followers;

    factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
        portfolio: json["portfolio"],
        following: json["following"],
        followers: json["followers"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
        "portfolio": portfolio,
        "following": following,
        "followers": followers,
    };
}

class ProfileImage {
    ProfileImage({
        this.small,
        this.medium,
        this.large,
    });

    String? small;
    String? medium;
    String? large;

    factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
    );

    Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
    };
}

class Social {
    Social({
        this.instagramUsername,
        this.portfolioUrl,
        this.twitterUsername,
        this.paypalEmail,
    });

    dynamic instagramUsername;
    dynamic portfolioUrl;
    dynamic twitterUsername;
    dynamic paypalEmail;

    factory Social.fromJson(Map<String, dynamic> json) => Social(
        instagramUsername: json["instagram_username"],
        portfolioUrl: json["portfolio_url"],
        twitterUsername: json["twitter_username"],
        paypalEmail: json["paypal_email"],
    );

    Map<String, dynamic> toJson() => {
        "instagram_username": instagramUsername,
        "portfolio_url": portfolioUrl,
        "twitter_username": twitterUsername,
        "paypal_email": paypalEmail,
    };
}
