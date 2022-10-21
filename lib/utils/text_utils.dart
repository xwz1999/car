import 'package:common_utils/common_utils.dart';

class TextUtils{

   static String getTimeByInt(int date){
      if(date<0){
         return '/';
      }else{
         return DateUtil.formatDateMs(
             ( date.toInt()) * 1000,
             format: 'yyyy-MM-dd');
      }

   }



   static String getAsteriskPhone(String phone){
      if (phone.length != 11) {
         return '手机号不正确';
      } else {
         return '${phone.substring(0, 3)}****${phone.substring(7, 11)}';
      }
   }

   ///判断空字符串
   ///white 全空格是否算空字符串
   static bool isEmpty(String str, {bool whiteSpace = false}) {
      if (whiteSpace) {
         return  str.trim().isEmpty;
      }
      return  str.isEmpty;
   }

   static bool isNotEmpty(String str, {bool whiteSpace = false}) {
      return !isEmpty(str, whiteSpace: whiteSpace);
   }

   static bool verifyPhone(phone) {
      return  RegExp("^^1\\d{10}\$").hasMatch(phone);
   }

   static String carInfoIsEmpty(String str,) {
      if (str.isEmpty) {
         return  '/';
      }
      return  str;
   }

   static String getPriceStr(num price){
      if (price<=0) {
         return price.toString();
      } else {
         return '${price/10000}万';
      }
   }
}