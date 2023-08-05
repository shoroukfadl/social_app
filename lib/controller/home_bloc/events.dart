abstract class HomeEvents {}
class GetUserDataEvent extends HomeEvents {}
class ChangeScreenEvent extends HomeEvents {
   int currindex;
   ChangeScreenEvent({required this.currindex});
}
 class PickProfileImageEvent extends HomeEvents {}
 class PickCoverImageEvent extends HomeEvents {}
 class UploadProfileImageEvent extends HomeEvents {}
 class UploadCoverImageEvent extends HomeEvents {}
 class UpdateInfoImagesEvent extends HomeEvents {
   String name;
   String phone;
   String bio;
   UpdateInfoImagesEvent(this.bio,this.phone,this.name);
 }
 class UpdateInfoEvent extends HomeEvents {
   String name;
   String phone;
   String bio;
   UpdateInfoEvent(this.bio,this.phone,this.name);
 }
// class PostsPageEvent extends HomeEvents {}

