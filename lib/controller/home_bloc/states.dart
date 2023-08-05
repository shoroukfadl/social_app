abstract class HomeStates {}
class HomeInitState extends HomeStates {}
class GetUserLoadingState extends HomeStates {}
class GetUserSuccessState extends HomeStates {}
class GetUserErrorState extends HomeStates {
  String? error;
  GetUserErrorState(this.error);
}

class ChangeScreenState extends HomeStates {}
class PickProfileImageState extends HomeStates {}
class SplitProfileImageState extends HomeStates {}

class UploadProfileImageLoadingState extends HomeStates {}
class UploadProfileImageSuccessState extends HomeStates {}
class UploadProfileImageErrorState extends HomeStates {
  String? error;
  UploadProfileImageErrorState(this.error);
}

class PickCoverImageState extends HomeStates {}
class SplitCoverImageState extends HomeStates {}

class UploadCoverImageLoadingState extends HomeStates {}
class UploadCoverImageSuccessState extends HomeStates {}
class UploadCoverImageErrorState extends HomeStates {
  String? error;
  UploadCoverImageErrorState(this.error);
}

class UpdateInfoImagesLoadingState extends HomeStates {}
class UpdateInfoImagesSuccessState extends HomeStates {}
class UpdateInfoImagesErrorState extends HomeStates {
  String? error;
  UpdateInfoImagesErrorState(this.error);
}

class UpdateInfoLoadingState extends HomeStates {}
class UpdateInfoSuccessState extends HomeStates {}
class UpdateInfoErrorState extends HomeStates {
  String? error;
  UpdateInfoErrorState(this.error);
}