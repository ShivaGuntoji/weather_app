import 'dart:io';

void main() async
{
  print("om sai ram");
  fun1();
  String res=await fun2();
  fun3(res);
}
void fun1()
{
  print("fun1");
  //String res=fun2();
}
Future<String> fun2() async
{
  Duration threeSeconds=Duration(seconds: 3);
  String res;
  await Future.delayed(threeSeconds,(){
    print('fun2 ');
    res= 'hi';
  });
  return res;
}
void fun3(String res)
{
  print("fun 3 $res");
  //print(res);
}