import '../config/routes.dart';

  class NavigationService {
  static void push(String path){
    routes.push(path);
  }
  static void pop(){
    routes.pop();
  }
  static void replace(String path){
    routes.replace(path);
  }
  static void go(String path){
    routes.go(path);
  }
}