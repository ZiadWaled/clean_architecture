abstract class BaseViewModel implements BaseViewModelInput, BaseViewModelOutput {
  // shared var , function
}
abstract class BaseViewModelInput{
  void start(); //start view model jop

  void dispose(); // will be call when view model dies
}

abstract class BaseViewModelOutput{
// will be implemented later
}
 